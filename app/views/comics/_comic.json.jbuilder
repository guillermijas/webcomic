json.extract! comic, :id, :user_id, :title, :price, :category, :average_rating, :created_at, :updated_at
json.url comic_url(comic, format: :json)
