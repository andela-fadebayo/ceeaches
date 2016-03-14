class CreateRecipeTable < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name
      t.string :by
      t.text :description
      t.text :directions
      t.text :ingredients
      t.string :source
      t.integer :favourites
      t.integer :likes
      t.integer :shares
      t.integer :comments

      t.timestamps null: false
    end
  end

  def down
    drop_table :recipes
  end
end
