require File.dirname(__FILE__) + "/form_helper_fieldset"

##
# Good Form builder for Ruby on Rails. Implements a form as shown
# originally by Khoi Vinh at http://www.subtraction.com/pics/0508/050822/.
#
# This uses the variant at http://examples.webtypes.com/goodform/.
# CSS can be copied by using the generator that ships with this plugin.
#
# All fields take a :label argument in options (or html_options
# for collection_select). The value will be used as the label
# content. The field name is used otherwise.
#
# TODO Display errors with CSS.

class GoodFormBuilder < ActionView::Helpers::FormBuilder

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
  
  ##
  # Unlike the other elements, the :label option should be passed in
  # the html_options Hash.
  
  def collection_select(field, collection, value_method, text_method, options={}, html_options={})
    label_class = (html_options.delete(:class) || 'field')
    @template.content_tag("label",
                          (html_options.delete(:label) || field.to_s.titleize) + super,
                          :class => label_class,
                          :for => [@object_name, field].join('_'))
  end

end



