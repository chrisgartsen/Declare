module NavTabHelper

  def nav_tab(items)

    content_tag(:ul, class: 'nav nav-tabs') do
      content_tag(:li, class: 'active') do
        'Home'
      end
    end

  end

end
