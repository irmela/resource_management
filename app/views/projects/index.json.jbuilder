json.array!(@projects) do |project|
  json.extract! project, :id, :name, :department, :color
  json.url project_url(project, format: :json)
end
