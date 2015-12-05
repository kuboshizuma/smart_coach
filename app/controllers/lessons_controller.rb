class LessonsController < ApplicationController
  def index
    @lessons = Lesson.order(updated_at: :DESC)
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

  private
  def lesson_params
    params.require(:lesson).permit(:title, :description, :genre_id, :thumbnail)
  end
end
