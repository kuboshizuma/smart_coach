class ChangeColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :repeat, :integer, default: 1
    add_column :rooms, :start_day, :date
    remove_column :rooms, :start_time, :date
    remove_column :rooms, :finish_time, :date
  end
end
