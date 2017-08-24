class BulmaFormbuilder < ActionView::Helpers::FormBuilder

  DEFAULT_SUBMIT_BUTTON_CAPTION = 'Submit'
  DEFAULT_SUBMIT_BUTTON_ID      = 'submit-button'


  def submit_button_horizontal(options = {})
    caption = options[:caption] || DEFAULT_SUBMIT_BUTTON_CAPTION
    id = options[:id] || DEFAULT_SUBMIT_BUTTON_ID

    content_tag(:div, class: 'field is-horizontal') do
      render_empty_label_div + render_submit_button(caption, id)
    end
  end

  def text_field_horizontal(field_name)
    content_tag(:div, class: 'field is-horizontal') do
      render_label(field_name) + render_text_field(field_name)
    end
  end

  private

    def render_submit_button(caption, id)
      content_tag(:div, class: 'field-body') do
        content_tag(:div, class: 'control') do
          submit(caption, id: id, class: 'button is-primary')
        end
      end
    end

    def render_empty_label_div
      content_tag(:div, class: 'field-label') do '' end
    end

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
