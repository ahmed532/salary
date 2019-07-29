class Department < ApplicationRecord
  has_many :staffs
  validates :name, presence: true, uniqueness: true  
end

