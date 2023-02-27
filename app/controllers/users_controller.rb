class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        log_in user
        render json: user, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def index
      users = User.all
      render json: users
    end
  
    def show
      user = User.find(params[:id])
      render json: user
    end
  
    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      user = User.find(params[:id])
      user.destroy
      head :no_content
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
  