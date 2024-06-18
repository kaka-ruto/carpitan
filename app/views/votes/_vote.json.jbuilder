json.extract! vote, :id, :type, :politician_id, :legislation_id, :user_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
