class CreateItemReviews < ActiveRecord::Migration
  def change
    create_table :item_reviews do |t|
      t.integer :item_id
      t.string :handlename
      t.text :comment

      t.timestamps null: false
    end
  end
end
