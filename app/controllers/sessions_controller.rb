
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    # authenticateは送れてきたパスをハッシュ化し、digestと同じか確認をする
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new, notice: '間違っとるで'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end