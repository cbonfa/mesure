require_relative "lib/mesure/version"

Gem::Specification.new do |spec|
  spec.name        = "mesure"
  spec.version     = Mesure::VERSION
  spec.authors     = ["cbonfa"]
  spec.email       = ["bonfa@inaum.net"]
  spec.homepage    = "https://github.com/cbonfa/mesure"
  spec.summary     = "Measure time of a code block and set timeout"
  spec.description = "Measure the execution time of a block and set a timeout if desired"
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cbonfa/mesure"
  spec.metadata["changelog_uri"] = "https://github.com/cbonfa/mesure/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 3"
end
