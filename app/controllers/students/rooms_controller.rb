class Students::RoomsController < ApplicationController
  def index
    @rooms = Room.order(updated_at: :DESC).includes(:lesson)
  end

  def show
    @room = Room.find(params[:id])
    @lesson = Lesson.find(@room.lesson_id)
  end

  def new
    @room = Room.new
    @room.lesson_id = params[:lesson_id]
  end

  def create
    if Room.create(room_params)
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:start_time, :finish_time, :lesson_id).merge(student_id: current_user.id)
  end
end
