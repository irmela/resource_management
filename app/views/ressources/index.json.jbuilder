json.array!(@ressources) do |ressource|
  json.extract! ressource, :id, :name, :department, :color
  json.url ressource_url(ressource, format: :json)
end
