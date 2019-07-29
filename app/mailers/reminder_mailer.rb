class ReminderMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def payment_email
    @admin = params[:admin]
    @payment_details = params[:payment_details]
    mail(to: @admin.email, subject: 'Payment Reminder')
  end
end
