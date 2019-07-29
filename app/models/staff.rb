class Staff < ApplicationRecord
  belongs_to :department
  has_secure_password

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  def self.salaries_total
    self.sum('base_salary')
  end

  def self.bonus_total
    self.sum('base_salary*monthly_bonus')
  end
end
