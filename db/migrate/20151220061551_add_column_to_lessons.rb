class AddColumnToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :start_day, :date
    add_column :lessons, :finish_day, :date
    add_column :lessons, :shift_minutes, :int
    add_column :lessons, :student_sum, :int, default: 0
  end
end
