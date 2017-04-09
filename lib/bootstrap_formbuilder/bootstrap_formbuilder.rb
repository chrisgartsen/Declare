require 'submit_button_group'
require 'text_field_group'
require 'error_message_group'

class BootstrapFormbuilder < ActionView::Helpers::FormBuilder

  include SubmitButtonGroup
  include TextFieldGroup
  include ErrorMessageGroup

  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
  end

end
