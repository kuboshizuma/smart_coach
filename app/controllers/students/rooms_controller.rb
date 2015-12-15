class Students::RoomsController < Students::StudentsController
  def index
    @rooms = Room.where(student_id: current_user.id).order(updated_at: :DESC).includes(:lesson)
  end

  def show
    @room = Room.find(params[:id])
    @lesson = Lesson.find(@room.lesson_id)
  end

  def new
    if !Lesson.exists?(id: params[:lesson_id])
      redirect_to root_path, notice: "このレッスンはもう存在しません" and return
    elsif room = Room.find_by(lesson_id: params[:lesson_id], student_id: current_user.id)
      redirect_to students_room_path(room), notice: "既に受講しています" and return
    end
    @lesson = Lesson.find(params[:lesson_id])
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
