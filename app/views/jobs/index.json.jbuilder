json.array!(@jobs) do |job|
  json.extract! job, :id, :project_id, :resource_id, :start_date, :end_date
  json.url job_url(job, format: :json)
end
