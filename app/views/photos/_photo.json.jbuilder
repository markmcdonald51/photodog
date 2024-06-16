json.extract! photo, :id, :title, :altitude, :latitude, :longitude, :image_views, :photo_taken_time, :url, :description, :device_type, :user_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
