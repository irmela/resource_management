json.array!(@ressources) do |ressource|
  json.extract! ressource, :id, :name, :department
  json.url ressource_url(ressource, format: :json)
end
