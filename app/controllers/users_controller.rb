class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :require_user
    before_action :haveManagerAccess
    before_action :set_user, only: [:show, :update, :destroy]

    #Users have role Managers and SuperAdmin can use this controller

    #Get all users
    #GET /users
    def index 
        users = User.all
        render json: users
    end
    
    #Get user
    #GET /users/:id
    def show
        render json: @user
    end

    #Create User
    #POST /users
    def create 
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: { errors: user.errors.full_messages }, status: :bad_request
        end
    end

    #Update user
    #PUT /users/:id
    def update
        if @user.update(user_update_params)
            render json: @user
        else
            render json: { errors: @user.errors.full_messages }, status: :bad_request
        end
    end


    #Delete user
    #DELETE /users/:id
    def destroy
        @user.destroy
        render json: { message: 'User time deleted successfully' }, status: :no_content
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:username, :password, :role_id)
    end

    def user_update_params
        params.permit(:username, :role_id)
    end

end
