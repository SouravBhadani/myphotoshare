json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :desc, :url, :tags, :type, :sub_type
  json.url blog_url(blog, format: :json)
end
