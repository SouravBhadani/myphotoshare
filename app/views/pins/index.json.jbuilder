json.array!(@pins) do |pin|
  json.extract! pin, :id, :descrption
  json.url pin_url(pin, format: :json)
end
https://www.youtube.com/watch?v=LW8p2F3gpMo