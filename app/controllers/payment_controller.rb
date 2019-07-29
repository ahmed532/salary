class PaymentController < ApplicationController

  let :admin, :summary
  let :all, :error
  
  def summary
    @months = []
    current_month = Date.today.month
    (current_month..12).each do |m|
      @months << MonthSummary.new(m)
    end
  end
  
  def error
    render json: { error: 'Not Authorized' }, status: 401
  end
end
