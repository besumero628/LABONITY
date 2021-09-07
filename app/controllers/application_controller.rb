class ApplicationController < ActionController::Base
  layout :set_layout
  
  private
  def set_layout
    if params[:controller].match(%r{\A(public|admin|company_admin)})
      Regexp.last_match[1]
    else
      "public"
    end
  end
  
end
