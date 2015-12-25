class AddUnreadToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :unread_student, :integer, default: 0
    add_column :rooms, :unread_coach, :integer, default: 0
  end
end
