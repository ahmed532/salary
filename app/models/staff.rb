class Staff < ApplicationRecord
  belongs_to :department
  has_secure_password

  validates :name,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :base_salary,
            presence: true,
            numericality: true # Probably should make it greater than 0 (taking money from staff?)
  validates :monthly_bonus,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 1}
  validates :department,
            presence: true

  after_initialize :init

  def init
    self.monthly_bonus ||= 0.1
    self.role ||= :user
  end
            

  enum role: [:user, :admin]
  
  def self.salaries_total
    self.sum('base_salary')
  end

  def self.bonus_total
    self.sum('base_salary*monthly_bonus')
  end
end
