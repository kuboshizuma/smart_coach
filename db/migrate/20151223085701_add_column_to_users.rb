class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduce, :text
    add_column :users, :age, :integer
    add_column :users, :belong, :string
    add_column :users, :facebook, :text
    add_column :users, :twitter, :text
  end
end
