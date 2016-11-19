json.extract! item, :id, :shop, :category, :item, :name, :price, :good, :bad, :image, :created_at, :updated_at
json.url item_url(item, format: :json)
