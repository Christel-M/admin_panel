class Admin < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  has_one_attached :avatar
  has_secure_password

  def full_name
    full_name = self.first_name.capitalize + " " + self.last_name.capitalize
    return full_name
  end

  def initials
    initials = self.first_name.chars.first.upcase + self.last_name.chars.first.upcase
  end

end
