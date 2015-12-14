class ChatMessage < ActiveRecord::Base
  belongs_to :room
  belongs_to :talker, class_name: "User"
end
