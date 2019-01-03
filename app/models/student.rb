class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :education, presence: true
  validates :age, inclusion: {in: 1..150, :message => "needs to be greater than 1 and less than 150"}
  # validates :email, presence: true
  # validates :password, presence: true
  # edu = %w(High\ School College Masters PHD)
  # validates_inclusion_of :education, :in => edu
  # belongs_to :admin

  def full_name
    full_name = self.last_name + ", " + self.first_name
    return full_name
  end

end
