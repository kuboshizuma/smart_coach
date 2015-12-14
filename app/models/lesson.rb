class Lesson < ActiveRecord::Base
  belongs_to :genre
  belongs_to :coach, class_name: "User"
  has_many :rooms

  mount_uploader :thumbnail, LessonThumbnailUploader
end
