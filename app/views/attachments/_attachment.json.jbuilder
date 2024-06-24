json.extract! attachment, :id, :title, :altitude, :latitude, :longitude, :image_views, :photo_taken_time, :url, :description, :device_id, :user_id, :attachable_id, :attachable_type, :type, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
