module TextField

  def text_field_horizontal(field_name)
    content_tag(:div, class: 'field is-horizontal') do
      render_label(field_name) + render_body(field_name)
    end
  end

  private

    def render_label(field_name)
      content_tag(:div, class: 'field-label is-normal') do
        label(field_name, class: 'label')
      end
    end

    def render_body(field_name)
      content_tag(:div, class: 'field-body') do
        content_tag(:div, class: 'field') do
          render_text_control(field_name) + render_error_message(field_name)
        end
      end
    end

    def render_text_control(field_name)
      if @object.errors.any?
        render_text_field_with_error(field_name)
      else
        render_text_field(field_name)
      end
    end

    def render_text_field(field_name)
      content_tag(:div, class: 'control') do
        text_field(field_name, class: 'input')
      end
    end

    def render_text_field_with_error(field_name)
      content_tag(:div, class: 'control has-icons-right') do
        text_field(field_name, class: 'input is-danger') + render_error_icon
      end
    end

    def render_error_message(field_name)
      content_tag(:p, class: 'help is-danger') do
        @object.errors.full_messages_for(field_name).first if @object.errors.any?
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
