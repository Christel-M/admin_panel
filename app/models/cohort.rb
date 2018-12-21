class Cohort < ApplicationRecord
  validates :name, presence: true

  has_one :instructor
  has_one :course

  has_and_belongs_to_many :students
end
