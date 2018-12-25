class Course < ApplicationRecord
  validates :name, presence: true
  validates :class_hours, presence: true
  # has_many :cohorts, optional: true
  has_many :cohorts
  belongs_to :admin
end
