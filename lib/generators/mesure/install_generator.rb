require 'rails/generators'

module Mesure
	class InstallGenerator < ::Rails::Generators::Base
	  	def create_initializer_file
		  	text = %{Mesure.configure do |c|\n  c.timing_log = 5\n  c.timeout = 25\nend}	
		    create_file "config/initializers/mesure.rb", text
	  	end
	end
end

# https://github.com/heartcombo/devise/blob/main/lib/generators/active_record/devise_generator.rb