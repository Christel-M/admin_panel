class Admin < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true


  # has_many :instructors
  # has_many :students
  # has_many :courses
  # has_many :cohorts
end
