json.extract! attachment_photo, :id, :title, :altitude, :latitude, :longitude, :image_views, :photo_taken_time, :url, :description, :device_id, :created_at, :updated_at
json.url attachment_photo_url(attachment_photo, format: :json)
