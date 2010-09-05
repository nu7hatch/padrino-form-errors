module Padrino
  module FormErrors
    module Generators
      class Defaults < Thor::Group
        # Add this generator to our padrino-gen
        Padrino::Generators.add_generator(:form_errors, self)

        # Define the source template root
        def self.source_root; File.expand_path(File.dirname(__FILE__)); end
        def self.banner; "padrino-gen form_errors"; end

        # Include related modules
        include Thor::Actions
        include Padrino::Generators::Actions

        desc "Description:\n\n\tpadrino-gen form_errors"

        # Create default views. 
        def create_views
          ext = fetch_component_choice(:renderer)
          self.destination_root = options[:root]
          if in_app_root?
            template "templates/#{ext}/_error_messages.#{ext}.tt", destination_root("/app/views/shared/_error_messages.html.#{ext}")
            template "templates/#{ext}/_error_message.#{ext}.tt",  destination_root("/app/views/shared/_error_message.html.#{ext}")
          else
            say "You are not at the root of a Padrino application! (config/boot.rb not found)"
          end
        end
      end # Defaults
    end # Generators
  end # FormErrors
end # Padrino
