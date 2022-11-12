class RecipeSerializer
  include JSONAPI::Serializer

  def self.new(recipes)
    {
      data: recipes
    }
  end
end
