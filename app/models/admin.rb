class Admin < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  has_secure_password


  # has_many :instructors
  # has_many :students
  # has_many :courses
  # has_many :cohorts
end
