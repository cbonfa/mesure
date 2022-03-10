require "mesure/version"
require "mesure/engine"
require "mesure/configuration"

module Mesure
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.timing(identifier, extra_info: nil, timing_log: nil,  &block)
    start = Time.now
    location = caller_locations(1, 1)&.first&.to_s[0, 255]
    binding.pry
    timing_log = timing_log.blank? ? Mesure.configuration.timing_log : timing_log
    return_block = block.call
    time = Time.now - start
    Mesure::Log.create(identifier: identifier, time: time, timeout: false, location: location, extra_info: call) if tempo > timing_log
    return_block
  end

  def self.timing_with_timeout(identifier, extra_info: nil, timeout: nil, timelog: nil, &block)
    http_errors = [
      Errno::ECONNRESET,
      Errno::EINVAL,
      Net::HTTPBadResponse,
      Net::HTTPHeaderSyntaxError,
      Net::ProtocolError,
      Timeout::Error
    ]
    start = Time.now
    location = caller_locations(1, 1)&.first&.to_s[0, 255]
    error = ''
    return_block = nil
    begin
      timing_log = timing_log.blank? ? Mesure.configuration.timing_log : timing_log
      timeout = timeout.blank? ? Mesure.configuration.timeout : timeout

      return_block = Timeout::timeout(timeout) {
        block.call
      }
    rescue *http_errors => e
      error = e.inspect
    end
    time = Time.now - start 
    Mesure::Log.create(identifier: identifier, time: time, timeout: !error.blank?, error: error, location: location, extra_info: call) if tempo > timing_log
    return_block
  end  

end
