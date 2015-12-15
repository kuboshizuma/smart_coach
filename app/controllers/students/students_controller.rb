class Students::StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :valify_student?

  private
  def valify_student?
    unless current_user.is_student?
      redirect_to root_path, notice: "生徒としてログインして下さい"
    end
  end
end
