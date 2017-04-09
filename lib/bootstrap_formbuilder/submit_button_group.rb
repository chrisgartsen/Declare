module SubmitButtonGroup

  DEFAULT_SUBMIT_CAPTION = 'Submit'

  # Submit button: generates a submit button
  # - with default caption: f.submit_button_group => 'Submit'
  # - with custom caption: f.submit_button_group('Update Name')

  def submit_button_group(caption = DEFAULT_SUBMIT_CAPTION, options={})

    content_tag(:div, class: 'form-group') do
      content_tag(:div, class: 'col-sm-offset-4 col-sm-8')  do
        submit(caption, class: 'btn btn-primary', id: options[:id]) + ' ' + back_url(options)
      end
    end

  end

  # include this so that form methods can be used in the builder

  def back_url(options)
    if options[:back_url]
      link_to('Back', options[:back_url], class: 'btn btn-default')
    end
  end

end
