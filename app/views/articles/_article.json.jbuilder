json.extract! article, :id, :issue_id, :title, :tagline, :author_id, :position, :created_at, :updated_at
json.url article_url(article, format: :json)
