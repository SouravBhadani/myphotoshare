json.array!(@pins) do |pin|
  json.extract! pin, :id, :descrption
  json.url pin_url(pin, format: :json)
end
