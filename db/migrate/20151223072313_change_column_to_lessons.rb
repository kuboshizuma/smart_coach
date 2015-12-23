class ChangeColumnToLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :description, :text
    add_column :lessons, :desc_goal, :text
    add_column :lessons, :desc_who, :text
    add_column :lessons, :desc_what, :text
    add_column :lessons, :desc_other, :text
  end
end
