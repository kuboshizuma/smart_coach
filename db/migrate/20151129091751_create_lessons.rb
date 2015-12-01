class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :coach
      t.references :genre

      t.timestamps null: false
    end
  end
end
