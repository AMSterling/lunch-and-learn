class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :country, :recipe_link, :recipe_title, :created_at
end
