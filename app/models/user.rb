class User < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, length: { minimum: 8 }, presence: true

  def self.authenticate_with_credentials (email, password)
    user = User.where("lower(email) = ?", email.downcase.strip).first
    if user && user.authenticate(password)
      user
    else
    nil
    end
  end

end
