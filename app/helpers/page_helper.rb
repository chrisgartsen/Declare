module PageHelper

  def pageheader(title)
    content_tag(:h1, class: 'title pageheader') do
      title
    end
  end

end
