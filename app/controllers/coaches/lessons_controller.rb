class Coaches::LessonsController < ApplicationController
  def index
    @lessons = Lesson.order(updated_at: :DESC)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @rooms = @lesson.rooms.includes(:student)
  end

  def new
    @lesson = Lesson.new

    genres = Genre.all
    @genres = genres.map { |genre| [genre.name, genre.id] }
  end

  def create
    unless Lesson.create(lesson_params)
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])

    genres = Genre.all
    @genres = genres.map { |genre| [genre.name, genre.id] }
  end

  def destroy
    lessons = Lesson.find(params[:id])
    lessons.delete
    redirect_to coaches_lessons_path
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :description, :genre_id, :thumbnail)
  end
end
