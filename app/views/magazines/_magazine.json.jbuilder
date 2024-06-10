json.extract! magazine, :id, :name, :description, :created_at, :updated_at
json.url magazine_url(magazine, format: :json)
json.description magazine.description.to_s
