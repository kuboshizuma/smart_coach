class Coaches::StudentsController < Coaches::CoachesController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @rooms = Room.where(lesson_id: params[:lesson_id]).includes(:student)
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
    room = Room.find_by(lesson_id: params[:lesson_id], student_id: params[:id])
    @student = room.student
  end
end
