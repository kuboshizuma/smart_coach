class ChangeFinishDateToLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :finish_day, :date
    add_column :lessons, :month, :integer
  end
end
