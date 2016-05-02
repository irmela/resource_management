json.array!(@resources) do |resource|
  json.extract! resource, :id, :name, :department, :color
  json.url resource_url(resource, format: :json)
end
