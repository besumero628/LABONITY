module ApplicationHelper
  include HtmlBuilder

  def document_title(page_title)
    if page_title.present?
      "#{page_title} | LABONITY"
    else
      'LABONITY'
    end
  end

  def flash_treatment(message_type)
    if default_message_type?(message_type)
      message_type
    elsif message_type == 'notice'
      'info'
    else
      'danger'
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
    else
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
    else
      'ERROR '
    end
  end

  private

  def default_message_type?(message_type)
    if (message_type != 'success') && (message_type != 'info') && (message_type != 'warning') && (message_type != 'danger')
      false
    else
      true
    end
  end
end
