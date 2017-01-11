module BreadcrumbHelper

  def breadcrumb(items={})
    content_tag(:ol, class: 'breadcrumb') do
      render_items(items)
    end
  end

  private

  def render_items(items)
    output = render_home_item(items)
    items.each do |caption, url |
      output += render_item(caption, url)
    end
    output
  end

  def render_item(caption, url)
    url == '#' ? render_static_item(caption) : render_active_item(caption, url)
  end

  def render_home_item(items)
    items.empty? ? render_static_item('Home') : render_active_item('Home', root_path)
  end

  def render_static_item(caption)
    content_tag(:li, class: 'active') do
      caption
    end
  end

  def render_active_item(caption, url)
    content_tag(:li) do
      link_to(caption, url)
    end
  end

end
