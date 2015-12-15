class CoachesController < ApplicationController
  def index
    @coaches = User.where(user_type: 1)
  end

  def show
    @coach = User.find_by(id: params[:id], user_type: 1)
  end
end
