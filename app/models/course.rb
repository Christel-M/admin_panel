class Course < ApplicationRecord
  validates :name, presence: true
  validates :class_hours, presence: true
  validates :class_hours, numericality: {greater_than: 0, :message => "Hours can't be a negative value"}
  # has_many :cohorts, optional: true
  has_many :cohorts
  # belongs_to :admin
end
