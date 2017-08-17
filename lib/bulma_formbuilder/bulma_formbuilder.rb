class BulmaFormbuilder < ActionView::Helpers::FormBuilder

  def submit(method, options = {})
    super(method, options)
  end

  def text_field(method, options = {})
    super(method, options)
  end

  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
  end

end
