class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  def is_coach?
    user_type == 1 || user_type == 3
  end

  def is_student?
    user_type == 0 || user_type == 3
  end

end
