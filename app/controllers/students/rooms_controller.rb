class Students::RoomsController < Students::StudentsController
  before_action :validate_before_create, only: [:new, :create]

  def index
    @rooms = Room.where(student_id: current_user.id).order(updated_at: :DESC).includes(:lesson)
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
    if latest_room = @lesson.during_lesson(params[:student_id], params[:start_day])
      redirect_to students_room_path(latest_room), notice: "登録済みの受講期間とかぶります。" and return
    end
    if Room.create(room_params)
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def validate_before_create
    lesson_id = params[:lesson_id] || params[:room][:lesson_id]

    if !Lesson.exists?(id: lesson_id)
      redirect_to root_path, notice: "このレッスンはもう存在しません" and return
    elsif room = Room.find_by(lesson_id: lesson_id, student_id: current_user.id)
      redirect_to students_room_path(room), notice: "既に受講しています" and return
    end

    @lesson = Lesson.find(lesson_id)
    unless @lesson.is_unoccupied?
      redirect_to lesson_path(@lesson), notice: "この講座は既に定員に達しています。" and return
    end

  end

  def room_params
    past_room = Room.where(lesson_id: params[:lesson_id], student_id: current_user.id).count
    params.require(:room).permit(:start_day, :finish_time, :lesson_id).merge(student_id: current_user.id).merge(repeat: past_room + 1)
  end
end
