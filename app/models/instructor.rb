class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :education, presence: true
  validates :age, inclusion: {in: 1..150, :message => "needs to be greater than 1 and less than 150"}
  validates :salary, numericality: {greater_than: 0, :message => "can't be less than 0"}
  has_many :cohorts
  # validates :email, presence: true
  # validates :password, presence: true

  # has_many :cohorts, optional: true
  # has_one :admin

  def full_name
    full_name = self.last_name + ", " + self.first_name
    return full_name
  end

end
