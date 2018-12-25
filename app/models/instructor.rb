class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :education, presence: true
  validates :age, inclusion: {in: 1..150}
  validates :salary, numericality: {other_than: 0}
  has_many :cohorts
  # validates :email, presence: true
  # validates :password, presence: true
  
  # has_many :cohorts, optional: true
  # has_one :admin

end
