json.extract! publication, :id, :header, :body, :user_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
