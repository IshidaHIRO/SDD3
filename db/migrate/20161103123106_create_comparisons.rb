class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.string :category
      t.string :item
      t.string :user
      t.string :comparison
      t.integer :point_type
      t.integer :point1
      t.text :comment1
      t.integer :point2
      t.text :comment2
      t.integer :point3
      t.text :comment3
      t.integer :good

      t.timestamps null: false
    end
  end
end
