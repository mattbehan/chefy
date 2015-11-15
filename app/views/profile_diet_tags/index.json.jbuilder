json.array!(@profile_diet_tags) do |profile_diet_tag|
  json.extract! profile_diet_tag, :id
  json.url profile_diet_tag_url(profile_diet_tag, format: :json)
end
