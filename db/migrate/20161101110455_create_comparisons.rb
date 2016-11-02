class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.integer :item_id
      t.string :user
      t.string :comparison
      t.integer :point_type
      t.integer :point
      t.text :comment

      t.timestamps null: false
    end
  end
end
