class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context

  delegate :label, :text_field, :date_field, :check_box, :radio_button, :text_area, :object, to: :form_builder

  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
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
