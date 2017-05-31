require 'submit_button_group'
require 'text_field_group'
require 'error_message_group'
require 'text_area_group'

class BootstrapFormbuilder < ActionView::Helpers::FormBuilder

  include SubmitButtonGroup
  include TextFieldGroup
  include ErrorMessageGroup
  include TextAreaGroup

  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
  end

end
