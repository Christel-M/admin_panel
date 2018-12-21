class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
  validates :education, presence: true
  # edu = %w(High\ School College Masters PHD)
  # validates_inclusion_of :education, :in => edu

  belongs_to :cohort, optional: true

end
