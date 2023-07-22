class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action  :require_user, only:[:destroy]


    # /login
    def create
        user = User.find_by(username: params[:username])
        if user.present? && user&.authenticate(params[:password])
          token = JWT.encode({ user_id: user.id }, 'secert_key', 'HS256')
          session[:user_id] = user.id
          render json: { token: token }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    #logout
    def destroy
        # deletes user session
        session[:user_id] = nil
        render json: { "message":"User logged out" }
    end


end
