class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/users/sign_in' unless @current_user

    @rooms = Chatroom.all
  end
  
  def create
    @room = Chatroom.new(room_params)

    respond_to do |format|
      if @room.save
        format.js   {}
        format.json { render :show, status: :created, location: @room }
      else
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end

  private

  def room_params
    params.require(:chatroom).permit(:topic)
  end
end
