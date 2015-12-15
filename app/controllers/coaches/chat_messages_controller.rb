class Coaches::ChatMessagesController < Coaches::CoachesController
  def index
    room = Room.find_by(lesson_id: params[:lesson_id], student_id: params[:student_id])
    @chat_messages = ChatMessage.where(room_id: room.id).order(updated_at: :DESC)
    @chat_message = ChatMessage.new(room_id: room.id, talker_id: current_user.id)

    @lesson = Lesson.find(params[:lesson_id])
    @student = User.find(params[:student_id])
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
    params.require(:chat_message).permit(:message, :room_id, :talker_id).merge(message_type: 0)
  end
end
