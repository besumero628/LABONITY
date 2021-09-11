class DeviseSignupFormPresenter < FormPresenter
  def full_name_block(name1, name2, label_text, options1={}, options2={})
    markup(:div, class:"field") do |m|
      m << label(name1, label_text, class:"label")
      m.div(class:"field-flex") do
        m << text_field(name1, options1)
        m << text_field(name2, options2)
        m << error_messages_for(name1)
        m << error_messages_for(name2)
      end
    end
  end
end