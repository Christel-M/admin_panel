class Course < ApplicationRecord
  validates :name, presence: true
  validates :class_hours, presence: true
  belongs_to :cohort, optional: true
end
