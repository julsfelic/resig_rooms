class User < ActiveRecord::Base
  has_many :api_keys

  validates :username, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
