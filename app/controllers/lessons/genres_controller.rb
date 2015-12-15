class Lessons::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @lessons = Lesson.where(genre_id: params[:id])
  end
end
