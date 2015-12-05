class Lesson < ActiveRecord::Base
  belongs_to :genre
  belongs_to :user

  mount_uploader :thumbnail, LessonThumbnailUploader
end
