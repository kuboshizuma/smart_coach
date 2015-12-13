class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.date :start_time
      t.date :finish_time
      t.references :lesson
      t.references :student
      t.timestamps null: false
    end
  end
end
