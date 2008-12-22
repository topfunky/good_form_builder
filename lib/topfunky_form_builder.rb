##
# Custom form builder.
#
# For use with CSS from http://examples.webtypes.com/goodform/

class TopfunkyFormBuilder < ActionView::Helpers::FormBuilder
  # helpers = field_helpers +
  #     %w{date_select datetime_select time_select} +
  #     %w{collection_select select country_select time_zone_select} -
  #     %w{hidden_field label fields_for} # Don't decorate these

  def text_field(field, *args)
    options = args.last.is_a?(Hash) ? args.pop : {}

    label_class = (options.delete(:class) || 'field')
    @template.content_tag("label",
                          (options.delete(:label) || field.to_s.titleize) + super,
                          :class => label_class,
                          :for => [@object_name, field].join('_'))
  end

  def radio_button(field, tag_value, options={})
    label_title = options.delete(:label)
    options[:class] = "radiobutton"
    super(field, tag_value, options) +
      label([field, tag_value].join('_'), label_title, :class => options[:class])
  end

  def check_box(field, options={}, checked_value='1', unchecked_value='0')
    label_title = options.delete(:label)
    options[:class] = "checkbox"
    super(field, options, checked_value, unchecked_value) +
      label(field, label_title, :class => options[:class])
  end

  def collection_select(field, collection, value_method, text_method, options={}, html_options={})
    label_class = (html_options.delete(:class) || 'field')
    @template.content_tag("label",
                          (html_options.delete(:label) || field.to_s.titleize) + super,
                          :class => label_class,
                          :for => [@object_name, field].join('_'))
  end

end



