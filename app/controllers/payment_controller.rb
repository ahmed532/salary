class PaymentController < ApplicationController
  def summary
    @month = MonthSummary.new params[:month]
  end
end
