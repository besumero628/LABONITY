class ApplicationController < ActionController::Base
  layout :set_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?

  private

  def set_layout
    if params[:controller].match(/\A(public|admin|company_admin)/)
      Regexp.last_match[1]
    else
      'public'
    end
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:login_id, :family_name, :given_name, :family_name_kana, :given_name_kana, :email, :post_id])
  end

end
