class BootstrapFormbuilder < ActionView::Helpers::FormBuilder

  def text_group(field_name)

    content_tag(:div, class: 'form-group') do

      label(:name, class: 'control-label col-sm-4') +

      content_tag(:div, class: 'col-sm-6') do
        text_field(field_name, class: 'form-control')
      end

    end

  end

  # include this so that form methods can be used in the builder

  def method_missing(method, *args, &block)
    @template.send(method, *args, &block)
  end

end
