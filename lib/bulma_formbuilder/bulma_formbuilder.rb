require 'submit_button'
require 'text_field'

class BulmaFormbuilder < ActionView::Helpers::FormBuilder

  include SubmitButton
  include TextField


  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
   end

end
