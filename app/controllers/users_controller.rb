class UsersController < ApplicationController
    protect_from_forgery with: :null_session
    #Create Application
    #POST /user
    def create 
        print user_params
        user = User.new(user_params)
        user.save
        json_render(user)
    end

    def json_render(reply)
        render json: reply.as_json(:except => :id)
    end

    def user_params
        params.require(:user).permit(:username, :password, :role_id)
      end
end
