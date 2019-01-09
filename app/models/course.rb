class Course < ApplicationRecord
  validates :name, presence: true
  validates :class_hours, presence: true
  validates :class_hours, numericality: {greater_than: 0, :message => "can't be a negative value"}
  has_many :cohorts
end
