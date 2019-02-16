class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])

    if user && user.authenticate(session_params[:password])
      log_in user
      return redirect_to session[:callback], notice: "ログインしました。" if session[:callback].present?
      redirect_to rooms_show_path, notice: "ログインしました。"
    else
      reder :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました。"
  end

  private
    def session_params
      params.require(:session).permit(:name, :password)
    end
end
