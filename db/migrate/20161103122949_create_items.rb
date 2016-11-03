class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :shop
      t.string :category
      t.string :item
      t.string :name
      t.integer :price
      t.float :calorie
      t.float :net
      t.float :protein
      t.float :fat
      t.float :carbon
      t.float :sugar
      t.float :fiber
      t.float :sodium

      t.timestamps null: false
    end
  end
end
