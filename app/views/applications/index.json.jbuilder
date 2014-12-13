json.array!(@applications) do |application|
  json.extract! application, :id, :name, :decription
  json.url application_url(application, format: :json)
end
