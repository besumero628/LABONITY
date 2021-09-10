module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :rescure500
    rescue_from ApplicationController::Forbidden, with: :rescure403
    rescue_from ApplicationController::IpAddressRejected, with: :rescure403
    rescue_from ActiveRecord::RecordNotFound, with: :rescure404
  end

  private

  def rescure403(exception)
    @exception = exception
    render 'errors/forbidden', status: :forbidden
  end

  def rescure404(exception)
    render 'errors/not_found', status: :not_found
  end

  def rescure500(exception)
    render 'errors/internal_server_error', status: :internal_server_error
  end
end
