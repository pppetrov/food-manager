class User < ActiveRecord::Base
  has_secure_password

  has_many :recipes

  validates :username, presence: true, uniqueness: true
  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true
end
