json.extract! photo, :id, :photo_id, :alt_text, :user_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
