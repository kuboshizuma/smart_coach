class Students::ChatMessagesController < Students::StudentsController
  def index
    @chat_messages = ChatMessage.where(room_id: params[:room_id]).order(updated_at: :DESC)
    @chat_message = ChatMessage.new(room_id: params[:room_id], talker_id: current_user.id)
  end

  def create
    if ChatMessage.create(chat_message_params)
      redirect_to action: :index
    else
      render :index
    end
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
