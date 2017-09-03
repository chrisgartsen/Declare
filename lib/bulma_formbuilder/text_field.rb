module TextField

  def text_field_horizontal(field_name, options = {})
    content_tag(:div, class: 'field is-horizontal') do
      render_label(field_name) + render_body(field_name, options)
    end
  end

  private

    def render_body(field_name, options)
      content_tag(:div, class: 'field-body') do
        content_tag(:div, class: 'field') do
          render_text_control(field_name, options) + render_error_message(field_name)
        end
      end
    end

    def render_text_control(field_name, options)
      if @object.errors[field_name].any?
        render_text_field_with_error(field_name, options)
      else
        render_text_field(field_name, options)
      end
    end

    def render_text_field(field_name, options)
      type = options[:type]

      content_tag(:div, class: 'control') do
        type && type.to_s == 'password' ? password_field(field_name, class: 'input') : text_field(field_name, class: 'input')
      end
    end

    def render_text_field_with_error(field_name, options)
      type = options[:type]

      content_tag(:div, class: 'control has-icons-right') do
        (type && type.to_s == 'password' ? password_field(field_name, class: 'input is-danger') : text_field(field_name, class: 'input is-danger')) + render_error_icon
      end
    end

    def render_error_icon
      content_tag(:span, class: 'icon is-small is-right') do
        content_tag(:i, class:'fa fa-warning') do
          ' '
        end
      end
    end

end
