class MonthSummary

  @@weekends = {Friday: {to_prev_thursday: -1, to_next_thursday: 5},
                Saturday: { to_prev_thursday: -2, to_next_thursday: 4 }}
  
  def initialize(month)
    @month = month
  end

  def month_name
    return Date::ABBR_MONTHNAMES[@month]
  end
  def salaries_payment_day
    last_day = Date.civil(Date.today.year, @month, -1)
    if weekend? last_day
      return last_day.day + @@weekends[day_name last_day].to_prev_thursday
    else
      return last_day.day
    end
  end
  
  def bonus_payment_day
    day_15 = Date.civil(Date.today.year, @month, 15)
    if weekend? day_15
      return day_15.day + @@weekends[day_name day_15].to_next_thursday
    else
      return day_15.day
    end
  end

  def salaries_total
  end

  def bonus_total
  end

  def payments_total
  end

  private
  def day_name day
    day.strftime "%A"
  end
  def weekend? day
    return @@weekends.keys.include? day_name(day)
  end
  
end
