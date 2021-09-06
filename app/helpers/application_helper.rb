module ApplicationHelper
  include HtmlBuilder

  def document_title(page_title)
    if page_title.present?
      "#{page_title} | LABONITY"
    else
      'LABONITY'
    end
  end
end
