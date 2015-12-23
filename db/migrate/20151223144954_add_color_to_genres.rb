class AddColorToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :color, :string
  end
end
