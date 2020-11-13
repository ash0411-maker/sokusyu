class SessionsController < ApplicationController

  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    #誰もログインしていない状態 => sesison[:user_id]がnil => ログアウト、もしくはログインしていない状態
    #誰かがログインしている状態 => sesison[:user_id]にログイン中のユーザーのIDが入る
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました"
    else
      render :new
    end
  end


  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました。"
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
