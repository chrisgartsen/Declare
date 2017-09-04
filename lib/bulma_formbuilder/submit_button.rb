module SubmitButton

  DEFAULT_SUBMIT_BUTTON_CAPTION = 'Submit'
  DEFAULT_SUBMIT_BUTTON_ID      = 'submit-button'

  def submit_button_horizontal(options = {})
    caption = options[:caption] || create_default_caption
    id = options[:id] || DEFAULT_SUBMIT_BUTTON_ID
    back_url = options[:back_url]

    content_tag(:div, class: 'field is-horizontal') do
      render_empty_label_div + render_submit_button(caption, id, back_url)
    end
  end

  private

    def create_default_caption
      if @object.new_record?
        'Create ' + @object.class.name
      else
        'Update ' + @object.class.name
      end
    end

    def render_empty_label_div
      content_tag(:div, class: 'field-label') do '' end
    end

    def render_submit_button(caption, id, back_url)
      content_tag(:div, class: 'field-body') do
        content_tag(:div, class: 'control') do
          submit(caption, id: id, class: 'button is-primary') + " " + render_back_button(back_url)
        end
      end
    end

    def render_back_button(back_url)
      link_to('Back', back_url, class: 'button') if back_url
    end

end
