json.array!(@chef_specialties) do |chef_specialty|
  json.extract! chef_specialty, :id
  json.url chef_specialty_url(chef_specialty, format: :json)
end
