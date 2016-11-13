class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :shop
      t.string :category
      t.string :item
      t.string :name
      t.integer :price
      t.integer :good
      t.integer :bad

      t.timestamps null: false
    end
  end
end
