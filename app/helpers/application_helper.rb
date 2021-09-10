module ApplicationHelper
  include HtmlBuilder

  def document_title(page_title)
    if page_title.present?
      "#{page_title} | LABONITY"
    else
      'LABONITY'
    end
  end
  
  def pull_flash_icon(message_type)
    case message_type
    when "success" then
      return "fas fa-lg fa-thumbs-up"
    when "info" then
      return "fas fa-lg fa-info-circle"
    when "warning" then
      return "fas fa-lg fa-bell"
    when "danger" then
      return "fas fa-lg fa-exclamation"
    end
  end
  
  def pull_flash_title(message_type)
    case message_type
    when "success" then
      return "SUCCESS "
    when "info" then
      return "INFO "
    when "warning" then
      return "WARNING "
    when "danger" then
      return "ERROR "
    end
  end

end
