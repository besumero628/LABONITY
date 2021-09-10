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
    when 'success'
      'fas fa-lg fa-thumbs-up'
    when 'info'
      'fas fa-lg fa-info-circle'
    when 'warning'
      'fas fa-lg fa-bell'
    when 'danger'
      'fas fa-lg fa-exclamation'
    end
  end

  def pull_flash_title(message_type)
    case message_type
    when 'success'
      'SUCCESS '
    when 'info'
      'INFO '
    when 'warning'
      'WARNING '
    when 'danger'
      'ERROR '
    end
  end
end
