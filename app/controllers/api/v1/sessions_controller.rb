class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          reset_session
          session[:user_id] = user.id
          render json: { message: 'ログインしました', user: user }
        else
          render json: { message: 'メールアドレスまたはパスワードが正しくありません' }, status: :unauthorized
        end
    end

    def destroy
        session.delete(:user_id)
        render json: { message: 'ログアウトしました' }
    end


end
