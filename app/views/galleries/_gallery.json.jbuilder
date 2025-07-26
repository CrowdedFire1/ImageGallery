json.extract! gallery, :id, :gallery_id, :name, :hidden, :user_id, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
