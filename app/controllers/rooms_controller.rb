class RoomsController < ApplicationController
  before_action :logged_in_user

  def show
    @messages = Message.all.order("id DESC")
    @user = User.find_by(id: current_user.id)
  end

  private
    def logged_in_user
      unless logged_in?
        session[:callback] = rooms_show_path
        return redirect_to root_path, flash: {danger: "ログインしてください。"}
      end
    end
end
