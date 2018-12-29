class Cohort < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :students

  belongs_to :instructor
  belongs_to :course
  # belongs_to :admin

end
