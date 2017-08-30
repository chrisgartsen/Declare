require 'submit_button'
require 'text_field'
require 'text_area'

class BulmaFormbuilder < ActionView::Helpers::FormBuilder

  include SubmitButton
  include TextField
  include TextArea

  def render_label(field_name)
    content_tag(:div, class: 'field-label is-normal') do
      label(field_name, class: 'label')
    end
  end

  def render_error_message(field_name)
    content_tag(:p, class: 'help is-danger') do
      @object.errors.full_messages_for(field_name).first if @object.errors.any?
    end
  end

  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
   end

end
