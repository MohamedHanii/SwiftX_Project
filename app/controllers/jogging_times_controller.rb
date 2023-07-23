class JoggingTimesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :require_user
    before_action :set_user, only: [:index, :create]
    before_action :set_jogging_time, only: [:show, :update, :destroy]
    before_action :authenticate_admin, only: [:index]

    def index
        if @user
            # Jogging times for a specific user (Admin access)
            jogging_times = @user.jogging_times
        else
            jogging_times = current_user.jogging_times
        end
        render json: jogging_times
    end

    def show
        render json: @jogging_time
    end

    def create
        jogging_time = JoggingTime.new(jogging_time_params)
        jogging_time.user_id = @user?@user.id : session[:user_id]
        
        if jogging_time.save
            render json: jogging_time, status: :created
        else
            render json: { errors: jogging_time.errors.full_messages }, status: :bad_request
        end
    end


    def update
        if @jogging_time.update(jogging_time_params)
            render json: @jogging_time
        else
            render json: { errors: @jogging_time.errors.full_messages }, status: :bad_request
        end
    end


    def destroy
        @jogging_time.destroy
        render json: { message: 'Jogging time deleted successfully' }, status: :no_content
    end


    private

    def set_jogging_time
        @jogging_time = JoggingTime.find(params[:id])
        if @jogging_time.belongs_to_different_user?(current_user.id) && current_user.role_id != 1
            render json: { error: 'You are not authorized' }, status: :forbidden
        end
    end

    def jogging_time_params
        params.permit(:time, :distance)
    end 

    def set_user
        @user = User.find_by(id: params[:user_id]) if params[:user_id]
        if  @user.nil? && params[:user_id]
            render json: { error: 'wrong user id' }, status: :bad_request
        end
    end

    def authenticate_admin
        if current_user.role_id != 1 && @user
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end
    

end
