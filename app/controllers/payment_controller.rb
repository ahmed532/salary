class PaymentController < ApplicationController
  def summary
    if current_staff.admin?
      @months = []
      current_month = Date.today.month
      (current_month..12).each do |m|
        @months << MonthSummary.new(m)
      end
    else
      render json: { error: 'Not Authorized' }, status: 401
    end
  end
end
