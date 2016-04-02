json.array!(@likes) do |like|
  json.extract! like, :id, :post_id, :created_at, :updated_at, :user_id
  json.url like_url(like, format: :json)
end
