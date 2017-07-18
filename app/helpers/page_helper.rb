module PageHelper

  def pageheader(title)
    content_tag(:h1, class: 'pageheader') do
      title
    end
  end

end
