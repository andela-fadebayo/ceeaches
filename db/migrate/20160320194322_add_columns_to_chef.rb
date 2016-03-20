class AddColumnsToChef < ActiveRecord::Migration
  def change
    add_column :chefs, :username, :string
    add_column :chefs, :first_name, :string
    add_column :chefs, :last_name, :string
    add_column :chefs, :image, :string

    add_index :chefs, :username, unique: true
  end
end
