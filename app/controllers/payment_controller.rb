class PaymentController < ApplicationController

  let :admin, :summary, :month_details
  let :all, :error
  
  def summary
    @months = []
    current_month = Date.today.month
    (current_month..12).each do |m|
      @months << MonthSummary.new(m)
    end
  end

  def month_details
    begin
      month_num = Integer(params[:month_num])
    rescue
      return render json: { error: 'Bad month number' }, status: 400
    end
    if not month_num.between?(1, 12)
      return render json: { error: 'Bad month number' }, status: 400
    end
    @month = MonthSummary.new(month_num)
  end
  
  def error
    render json: { error: 'Not Authorized' }, status: 401
  end
end
