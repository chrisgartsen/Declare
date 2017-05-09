module TextAreaGroup

  def text_area_group(field_name)
    content_tag(:div, class: 'form-group') do
      render_label(field_name) + render_text_area(field_name)
    end
  end

  private

  def render_text_area(field_name)
    content_tag(:div, class: 'col-sm-6') do
      text_area(field_name, class: 'form-control', rows: 10)
    end
  end

  def render_label(field_name)
    label(field_name, class: 'control-label col-sm-4')
  end

end
