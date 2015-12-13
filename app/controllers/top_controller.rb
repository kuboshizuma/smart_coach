class TopController < ApplicationController
  def index
    @lessons = Lesson.order(updated_at: :DESC)
  end
end
