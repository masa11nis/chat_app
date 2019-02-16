class RoomsController < ApplicationController
  before_action :logged_in_user

  def show
    @messages = Message.all
  end

  private
    def logged_in_user
      unless logged_in?
        session[:callback] = rooms_show_path
        return redirect_to login_path, flash: {danger: "ログインしてください。"}
      end
    end
end
