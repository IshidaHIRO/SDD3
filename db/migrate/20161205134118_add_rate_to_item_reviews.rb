class AddRateToItemReviews < ActiveRecord::Migration
  def change
    add_column :item_reviews, :rate, :integer
  end
end
