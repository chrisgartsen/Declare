module TextFieldGroup

  # Text field: generates a label and text field
  #
  # example: f.text_field_group(:name)

  def text_field_group(field_name)
    content_tag(:div, class: 'form-group') do
      render_label(field_name) + render_text_field(field_name)
    end
  end

  private

  def render_text_field(field_name)
    content_tag(:div, class: 'col-sm-6') do
      text_field(field_name, class: 'form-control')
    end
  end

  def render_label(field_name)
    label(field_name, class: 'control-label col-sm-4')
  end

end
