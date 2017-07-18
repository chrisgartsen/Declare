module TableHelper

  def table(column_names =[], &block)
    content_tag(:table, class: 'table') do
      render_head(column_names) + render_body(&block)
    end
  end

  private

  def render_head(column_names)
    content_tag(:thead) do
      render_columns(column_names)
    end

  end

  def render_columns(column_names)
    output = ''
    column_names.each do |name |
      output += render_column(name)
    end
    return output.html_safe
  end

  def render_column(name)
    content_tag(:th) do
      name
    end
  end

  def render_body(&block)
    content_tag(:tbody) do
      block.call unless block.nil?
    end
  end

end
