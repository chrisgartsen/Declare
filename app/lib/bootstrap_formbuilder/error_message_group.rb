module ErrorMessageGroup

  def error_message_group
    render_error_message if @object.errors.any?
  end

  private

  def render_error_message
    content_tag(:div, class: 'alert alert-danger') do
      render_error_header + render_error_subheader + render_errors
    end
  end

  def render_error_header
    content_tag(:strong) do
      'A problem has occurred while submitting your data.'
    end
  end

  def render_error_subheader
    content_tag(:p) do
      "#{pluralize(@object.errors.count, 'error')} prohibited this #{@object.class.model_name.human} from being saved:"
    end
  end

  def render_errors
    content_tag(:ul) do
      render_error_list
    end
  end

  def render_error_list
    list = ''
    @object.errors.full_messages.each do |message |
      list += content_tag(:li) { message }
    end
    list.html_safe
  end

end
