class Coaches::LessonsController < Coaches::CoachesController
  def index
    @lessons = Lesson.where(coach_id: current_user.id).order(updated_at: :DESC)
    @user = User.find_by(params[:user_id])
  end

  def show
    @lesson = Lesson.find(params[:id])
    @rooms = @lesson.rooms.includes(:student)
  end

  def new
    @lesson = Lesson.new
    @lesson.lesson_shifts.build

    genres = Genre.all
    @genres_options = genres.map { |genre| [genre.name, genre.id] }
  end

  def create
    unless Lesson.create(lesson_params)
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])

    genres = Genre.all
    @genres_options = genres.map { |genre| [genre.name, genre.id] }
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    redirect_to coaches_lessons_path
  end

  def destroy
    lessons = Lesson.find(params[:id])
    lessons.destroy
    redirect_to coaches_lessons_path
  end

  private
  def lesson_params
    shift_minutes = 0
    params[:lesson][:lesson_shifts_attributes].each_value do |shift|
      shift_minutes += ((Time.parse(shift[:finish_time]) - Time.parse(shift[:start_time])).to_i / 60).to_i
    end
    params.require(:lesson).permit(:title, :genre_id, :thumbnail, :start_day, :month, :desc_goal, :desc_who, :desc_what, :desc_other, lesson_shifts_attributes: [:weekday, :start_time, :finish_time]).merge(shift_minutes: shift_minutes, coach_id: current_user.id)
  end
end
