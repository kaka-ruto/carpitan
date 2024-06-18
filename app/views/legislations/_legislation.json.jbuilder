json.extract! legislation, :id, :title, :description, :status, :user_id, :created_at, :updated_at
json.url legislation_url(legislation, format: :json)
