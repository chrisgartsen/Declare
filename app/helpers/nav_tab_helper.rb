module NavTabHelper

  def nav_tab(tab_items = {})
    content_tag(:ul, class: 'nav nav-tabs') do
      render_tab_items(tab_items) unless tab_items.empty?
    end
  end

  private

  def render_tab_items(tab_items)
    output = ''
    tab_items.each do |caption, url |
      if url == '#'
        output += render_active_tab_item(caption)
      else
        output += render_link_tab_item(caption, url)
      end
    end
    return output.html_safe
  end

  def render_link_tab_item(caption, url)
    content_tag(:li) do
      link_to(caption, url)
    end
  end

  def render_active_tab_item(caption)
    content_tag(:li, class: 'active') do
      link_to(caption, '#')
    end
  end

end
