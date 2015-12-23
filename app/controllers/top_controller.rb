class TopController < ApplicationController
  def index
    @lessons = Lesson.order(updated_at: :DESC).includes(:coach, :genre)
    @genres = Genre.all
  end
end
