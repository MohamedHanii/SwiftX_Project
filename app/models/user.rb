class User < ApplicationRecord
  has_secure_password 

  belongs_to :role

  validates :username, presence: true, uniqueness: true
end
