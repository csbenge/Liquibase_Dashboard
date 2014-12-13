json.array!(@environments) do |environment|
  json.extract! environment, :id, :name, :decription, :application_id
  json.url environment_url(environment, format: :json)
end
