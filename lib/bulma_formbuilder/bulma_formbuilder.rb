class BulmaFormbuilder < ActionView::Helpers::FormBuilder

  def submit(method, options = {})
    super(method, options)
  end

  def text_field_horizontal(field_name)
    content_tag(:div, class: 'field is-horizontal') do
      render_label(field_name) + render_text_field(field_name)
    end
  end

  private

    def render_label(field_name)
      content_tag(:div, class: 'field-label is-normal') do
        label(field_name, class: 'label')
      end
    end

    def render_text_field(field_name)
      content_tag(:div, class: 'field-body') do
        content_tag(:div, class: 'field') do
          content_tag(:p, class: 'control') do
            text_field(field_name, class: 'input')
          end
        end
      end
    end

  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
  end

end
