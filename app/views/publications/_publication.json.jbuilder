json.extract! publication, :id, :comic_id, :free, :page, :text, :created_at, :updated_at
json.url publication_url(publication, format: :json)
