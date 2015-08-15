json.array!(@prettylinks) do |prettylink|
  json.extract! prettylink, :id, :url, :title, :image, :user_id
  json.url prettylink_url(prettylink, format: :json)
end
