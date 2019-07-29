class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_staff

  def current_clearance_levels
    @current_staff.role || :user
  end

  def unauthorized_access_redirection_path
    payment_error_path
  end
  
  private

  def authenticate_request
    @current_staff = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_staff
  end
end
