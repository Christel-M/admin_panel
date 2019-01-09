class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :education, presence: true
  # validates_uniqueness_of :email, presence: true
  validates :age, inclusion: {in: 1..150, :message => "needs to be greater than 1 and less than 150"}
  validates :salary, numericality: {greater_than: 0, :message => "can't be less than 0"}
  has_many :cohorts
  has_one_attached :avatar

  def full_name
    full_name = self.first_name.capitalize + " " + self.last_name.capitalize
    return full_name
  end

  def initials
    initials = self.first_name.chars.first.upcase + self.last_name.chars.first.upcase
  end

end
