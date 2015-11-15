json.array!(@recipes_diet_tags) do |recipes_diet_tag|
  json.extract! recipes_diet_tag, :id
  json.url recipes_diet_tag_url(recipes_diet_tag, format: :json)
end
