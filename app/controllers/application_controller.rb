class ApplicationController < ActionController::Base
  layout :set_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers #if Rails.env.production?


  def after_sign_in_path_for(resource)
    case resource
    when User
      public_mypage_path(resource)
    when Admin
      admin_root_path
    when CompanyAdmin
      company_admin_root_path
    end
  end
  
  def have_authenticate?(user)
    if current_user.id != user.id
      raise Forbidden
    end
  end


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
