class SendTwoDayReminder

  def run
    current_month_summary = MonthSummary.new(Date.today.month)
    if current_month_summary.salaries_payment_day - Date.today.day == 2 
      remind_admins current_month_summary, 'salary'
    end
    if current_month_summary.bonus_payment_day - Date.today.day == 2 
      remind_admins current_month_summary, 'bonus'
    end
  end
  
  def remind_admins current_month_summary, salary_or_bonus
    if salary_or_bonus == 'salary'
      payment_details = { date: current_month_summary.salaries_payment_date,
                          salary_or_bonus: salary_or_bonus,
                          amount: current_month_summary.salaries_total}
    else
       payment_details = { date: current_month_summary.salaries_payment_date,
                          salary_or_bonus: salary_or_bonus,
                          amount: current_month_summary.bonus_total}
    end
    Staff.where(role: :admin).find_each do |admin|
      ReminderMailer.with(admin: admin, payment_details: payment_details).payment_email.deliver_now
    end
  end
end
