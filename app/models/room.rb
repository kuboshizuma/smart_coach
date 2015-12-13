class Room < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :student, class_name: "User"
end
