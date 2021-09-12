class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context

  delegate :label, :text_field, :date_field,:password_field, :check_box, :radio_button, :text_area, :object, to: :form_builder

  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
  end
  
  def text_field_block(name, label_text, options={})
    markup(:div, class:"field") do |m|
      m << label(name, label_text, class:"label")
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def password_field_block(name, label_text, options={})
    markup(:div, class:"field") do |m|
      m << label(name, label_text, class:"label")
      m << password_field(name, options)
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
