class Staff < ApplicationRecord
  belongs_to :department
  has_secure_password

  def self.salaries_total
    self.sum('base_salary')
  end

  def self.bonus_total
    self.sum('base_salary*monthly_bonus')
  end
end
