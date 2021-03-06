class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context

  delegate :label, :text_field, :date_field, :datetime_field, :file_field,
           :password_field, :check_box, :radio_button, :select, :collection_select,
           :text_area, :object, to: :form_builder

  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
  end

  def text_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end

  def text_area_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << text_area(name, options)
      m << error_messages_for(name)
    end
  end

  def password_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << password_field(name, options)
      m << error_messages_for(name)
    end
  end

  def file_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << file_field(name, options)
      m << error_messages_for(name)
    end
  end

  def select_block(name, label_text, collection, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << select(name, collection, options)
      m << error_messages_for(name)
    end
  end

  def collection_select_block(name, label_text, collection, colomun, display_column, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << collection_select(name, collection, colomun, display_column, options)
      m << error_messages_for(name)
    end
  end

  def date_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << date_field(name, options)
      m << error_messages_for(name)
    end
  end

  def datetime_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << datetime_field(name, options)
      m << error_messages_for(name)
    end
  end

  def radio_button_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << radio_button(name, options)
      m << error_messages_for(name)
    end
  end

  def check_box_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m << label(name, label_text, class: 'label')
      m << check_box(name, options)
      m << error_messages_for(name)
    end
  end

  def error_messages_for(name)
    markup do |m|
      object.errors.full_messages_for(name).each do |message|
        m.div(class: 'error-message') do |n|
          n.text message
        end
      end
    end
  end
end
