module TextArea

  def text_area_horizontal(field_name)
    content_tag(:div, class: 'field is-horizontal') do
      render_label(field_name) + render_area_body(field_name)
    end
  end

  private

    def render_area_body(field_name)
      content_tag(:div, class: 'field-body') do
        content_tag(:div, class: 'field') do
          render_area_control(field_name) + render_error_message(field_name)
        end
      end
    end

    def render_area_control(field_name)
      if @object.errors[field_name].any?
        render_text_area_with_error(field_name)
      else
        render_text_area(field_name)
      end
    end

    def render_text_area(field_name)
      content_tag(:div, class: 'control') do
        text_area(field_name, class: 'textarea')
      end
    end

    def render_text_area_with_error(field_name)
      content_tag(:div, class: 'control has-icons-right') do
        text_area(field_name, class: 'textarea is-danger')
      end
    end

end
