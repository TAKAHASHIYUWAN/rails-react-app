class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      log_in user
      render json: user
    else
      render json: { errors: ['Invalid email or password'] }, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    head :no_content
  end
end