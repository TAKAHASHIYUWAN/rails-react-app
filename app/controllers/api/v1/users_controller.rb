class Api::V1::UsersController < ApplicationController
    #before_action :authenticated_user! only: [:index]
    #before_actionは :(method)のようにメソッド名をシンボルとして受け取る。
    def create
        user = User.new(user_params)
        if user.save
          #session[:user_id] = user.id
          render json: { message: 'ユーザー登録が完了しました', user: user }
        else
          render json: { message: 'ユーザー登録に失敗しました', errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
      user = User.find_by(id: params[:id])
      if logged_in?(user)
        if user.update(user_params)
          render json: { message: '更新しました',}, status: :ok
        else
          render json: { message: '更新に失敗しました'}, status: :unprocessable_entity
        end
      end

    end

    def delete
      user = User.find_by(id: params[:id])
      user.destroy
    end


    def index
        render json: User.all
    end

    def show
      user = User.find_by(id: params[:id])
      render json: user
    end
    
    private

      def user_params
        params.permit(:name ,:email, :password)
      end




end
