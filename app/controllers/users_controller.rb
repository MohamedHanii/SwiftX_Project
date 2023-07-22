class UsersController < ApplicationController
    protect_from_forgery with: :null_session


    #Create Application
    #POST /user
    def create 
        print params
        user = User.new(user_params)    
        print user
        if user.save
            token = JWT.encode({ user_id: user.id }, 'secert_key', 'HS256')
            render json: { token: token }
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end



    def json_render(reply)
        render json: reply.as_json(:except => :id)
    end

    def user_params
        params.permit(:username, :password, :role_id)
      end
end
