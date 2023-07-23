class JoggingTime < ApplicationRecord
  belongs_to :user

    # Custom method to check if the jogging time belongs to a different user
    def belongs_to_different_user?(current_user_id)
      user_id != current_user_id
    end
    
end
