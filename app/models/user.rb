class User < ApplicationRecord
  has_secure_password 

  belongs_to :role
  has_many :jogging_times
  validates :username, presence: true, uniqueness: true
end
