module Padrino
  module FormErrors
    module Helpers
      module FormHelpers
        ##
        # It displays validation errors for given object. Here is an HAML example:
        # 
        # ==== Examples
        #
        #   - form_tag url(:users) do
        #     = error_messages_for(@user)
        #     -# ...
        # 
        def error_messages_for(*objects)
          objects.map! do |object| 
            if object.is_a? Symbol 
              instance_variable_get("@#{object}")
            elsif object.respond_to? :object
              object = object.object
            else
              object 
            end
          end
          errors = objects.map {|object| object.errors }.flatten
          if errors.size > 0
            partial "shared/error_messages", :locals => { :object => objects.first, :errors => errors }
          end 
        end
        
        ##
        # It displays inline error for single field. 
        #
        # ==== Examples
        #
        #   - form_tag url(:sessions_login) do
        #     = label "Login", :for => :login
        #     = text_field_tag :login
        #     = error_messages_on(@session, :login)
        #     -# ...
        #
        def error_messages_on(object, field)
          object = instance_variable_get("@#{object}") if object.is_a?(Symbol)
          error = object.errors[field] rescue nil
          if error
            partial "shared/error_message", :locals => { :object => object, :field => field, :error => error }
          end
        end
      end # FormHelpers
    end # Helpers
  end # FormErrors
end # Padrino
