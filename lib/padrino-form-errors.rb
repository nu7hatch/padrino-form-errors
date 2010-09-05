require 'padrino-core'
require 'padrino-gen'
require 'padrino-helpers'

FileSet.glob_require('padrino-form-errors/*.rb', __FILE__)
FileSet.glob_require('padrino-form-errors/helpers/*.rb', __FILE__)

module Padrino
  ##
  # This component is used to display flexible error messages in your forms. 
  #
  module FormErrors
    ##
    # Method used by Padrino::Application when we register the extension
    #
    class << self
      def registered(app)
        app.helpers Padrino::FormErrors::Helpers::FormHelpers
      end
      alias :included :registered
    end
  end
end

##
# Load our Padrino::Responders locales
#
I18n.load_path += Dir["#{File.dirname(__FILE__)}/padrino-form-errors/locale/**/*.yml"]

##
# Now we need to add form explanations views generators to padrino-gen
#
Padrino::Generators.load_paths << Dir[File.dirname(__FILE__) + '/padrino-form-errors/generators/{errors_explanation}.rb']

