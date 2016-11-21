json.extract! item_review, :id, :item_id, :handlename, :comment, :created_at, :updated_at
json.url item_review_url(item_review, format: :json)