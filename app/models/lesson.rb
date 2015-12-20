class Lesson < ActiveRecord::Base
  attr_accessor :month

  belongs_to :genre
  belongs_to :coach, class_name: "User"
  has_many :rooms
  has_many :lesson_shifts, dependent: :destroy
  accepts_nested_attributes_for :lesson_shifts, allow_destroy: true

  mount_uploader :thumbnail, LessonThumbnailUploader

  def is_unoccupied?
    shift_minutes > (student_sum + 1) * 2 * 60
  end
end
