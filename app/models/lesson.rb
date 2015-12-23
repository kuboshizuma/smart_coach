class Lesson < ActiveRecord::Base

  belongs_to :genre
  belongs_to :coach, class_name: "User"
  has_many :rooms
  has_many :lesson_shifts, dependent: :destroy
  accepts_nested_attributes_for :lesson_shifts, allow_destroy: true

  mount_uploader :thumbnail, LessonThumbnailUploader

  def is_unoccupied?
    shift_minutes > (student_sum + 1) * 2 * 60
  end

  def lesson_limit
    (shift_minutes / 2 / 60).ceil
  end

  def during_lesson(student_id, new_start_day)
    latest_room = Room.where(student_id: student_id, lesson_id: id).order(created_at: :DESC).first
    return latest_room if latest_room.blank?

    if latest_room.start_day + 1.month < new_start_day
      return latest_room
    else
      return false
    end
  end
end
