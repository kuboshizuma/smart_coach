class Students::ChatMessagesController < Students::StudentsController
  def index
    @chat_messages = ChatMessage.where(room_id: params[:room_id]).order(updated_at: :DESC)
    @chat_message = ChatMessage.new(room_id: params[:room_id], talker_id: current_user.id)
  end

  def pusher
    if chat_message = ChatMessage.create(chat_message_params)
      room = Room.find(params[:chat_message][:room_id])
      Pusher["room_#{chat_message.room_id}"].trigger('chat_event', {
        lesson_id: room.lesson_id,
        student_id: room.student_id,
        room_id: room.id,
        chat_id: chat_message.id
      })
      render :text => 'OK', :status => 200
    else
      render :index
    end
  end

  def create
    @chat_messages = ChatMessage.where(room_id: params[:room_id]).includes(:talker)
  end

  def destroy
    chat_message = ChatMessage.find(params[:id])
    chat_message.delete
    if request.referer
      redirect_to :back
    else
      redirect_to root_path
    end
  end

  private
  def chat_message_params
    params.require(:chat_message).permit(:message, :room_id, :talker_id).merge(message_type: 1)
  end

end
