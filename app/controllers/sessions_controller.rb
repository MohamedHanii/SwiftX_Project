class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    # /login
    def create
        user = User.find_by(username: params[:username])
        print "here ",user.username
        print "here ",user.password
        print "here ",params[:password]
        if user&.authenticate(params[:password])
          token = JWT.encode({ user_id: user.id }, 'secert_key', 'HS256')
          render json: { token: token }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

end
