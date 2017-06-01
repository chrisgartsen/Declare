module NavTabHelper

  def nav_tab(items = {})

    return nil if items.empty?

    return content_tag(:ul, class: 'nav nav-tabs') do
      render_tabs(items)
    end

  end

  private

  def render_tabs(items)
    output = ""
    items.each do |caption, url |
      output += render_tab(caption, url)
    end
    raw(output)
  end

  def render_tab(caption, url)
    url == '#' ? render_current_tab(caption) : render_link_tab(caption, url)
  end

  def render_current_tab(caption)
    content_tag(:li, class: 'active') do
      link_to(caption, '#')
    end
  end

  def render_link_tab(caption, url)
    content_tag(:li) do
      link_to(caption, url)
    end
  end
end
