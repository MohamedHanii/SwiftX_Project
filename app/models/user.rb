class User < ApplicationRecord
  belongs_to :role
  has_many: jogging_times, dependent: destory
end
