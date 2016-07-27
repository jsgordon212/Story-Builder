class User < ApplicationRecord
  has_secure_password
  has_many :projects
  validates :email, :username, :password, presence: true
  validates :username, uniqueness: true
end
