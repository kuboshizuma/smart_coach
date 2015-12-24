class AddMonthToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :month, :integer, default: 2
  end
end
