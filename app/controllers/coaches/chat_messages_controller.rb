class Coaches::ChatMessagesController < Coaches::CoachesController
  def index
    room = Room.find_by(lesson_id: params[:lesson_id], student_id: params[:student_id])
    @chat_messages = ChatMessage.where(room_id: room.id).includes(:talker)
    @chat_message = ChatMessage.new(room_id: room.id, talker_id: current_user.id)

    @lesson = Lesson.find(params[:lesson_id])
    @student = User.find(params[:student_id])
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
    room = Room.find_by(lesson_id: params[:lesson_id], student_id: params[:student_id])
    @chat_messages = ChatMessage.where(room_id: room.id).includes(:talker)
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
