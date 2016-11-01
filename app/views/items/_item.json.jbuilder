json.extract! item, :id, :shop, :category, :item, :name, :price, :calorie, :net, :protein, :fat, :carbon, :sugar, :fiber, :sodium, :created_at, :updated_at
json.url item_url(item, format: :json)