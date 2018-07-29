json.extract! vote, :id, :weight, :type, :description, :created_at, :updated_at
json.url vote_url(vote, format: :json)
