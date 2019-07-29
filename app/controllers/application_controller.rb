class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_staff

  private

  def authenticate_request
    @current_staff = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_staff
  end
end
