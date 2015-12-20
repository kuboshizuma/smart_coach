class CreateLessonShifts < ActiveRecord::Migration
  def change
    create_table :lesson_shifts do |t|
      t.integer :weekday
      t.time :start_time
      t.time :finish_time
      t.references :lesson

      t.timestamps null: false
    end
  end
end
