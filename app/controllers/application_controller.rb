class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            render json: { error: 'You must login first' }, status: :unauthorized
        end
    end

    def haveManagerAccess
        if @current_user.role_id == 3
            render json: { error: 'You are not allowed to do that operation' }, status: :forbidden
        end
    end 


end
