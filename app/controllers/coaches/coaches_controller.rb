class Coaches::CoachesController < ApplicationController
  before_action :authenticate_user!
  before_action :valify_coaches?

  private
  def valify_coaches?
    unless current_user.is_coach?
      redirect_to root_path, notice: "コーチとしてログインして下さい"
    end
  end
end
