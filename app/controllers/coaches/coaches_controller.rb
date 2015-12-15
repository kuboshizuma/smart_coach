class Coaches::CoachesController < ApplicationController
  before_action :authenticate_user!
  before_action :valify_coach?

  private
  def valify_coach?
    unless current_user.is_coach?
      redirect_to root_path, notice: "コーチとしてログインして下さい"
    end
  end
end
