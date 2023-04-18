class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/users/sign_in' unless @current_user

    @rooms = Chatroom.all
    @users = User.all
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end
end
