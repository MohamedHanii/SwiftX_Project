class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token


    #Create User
    #POST /user
    def create 
        user = User.new(user_params)    
        if user.save
            token = JWT.encode({ user_id: user.id }, 'secert_key', 'HS256')
            session[:user_id] = user.id
            render json: { token: token }
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def user_params
        params.permit(:username, :password, :role_id)
    end
end
