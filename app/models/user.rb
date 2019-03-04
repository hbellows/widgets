class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email,:password, :role, presence: true
  validates :password_confirmation,  presence: true, on: :create       
  validates :email, uniqueness: true

  enum role: %i[user admin]
end
