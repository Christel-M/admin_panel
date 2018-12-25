class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
  validates :education, presence: true
  # edu = %w(High\ School College Masters PHD)
  # validates_inclusion_of :education, :in => edu
  validates :age, inclusion: {in: 1..150}
  belongs_to :admin
end
