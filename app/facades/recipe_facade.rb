class RecipeFacade
  def self.randomized
    CountryService.get_random_country
  end

  def self.recipes_from_country(searched_country)
    case
    when searched_country
      country_result = CountryService.get_country(searched_country)
      if country_result == [:message, "Page Not Found"]
        data = []
      elsif country_result == [:status, 404]
        data = []
      else
        valid_country = country_result[:name][:common].parameterize(preserve_case: true)
        @recipes = RecipeService.get_recipe_by_country(@country = valid_country)

        recipe_details
      end
    else
      @recipes = RecipeService.get_recipe_by_country(@country = self.randomized)

      recipe_details
    end
  end

  def self.recipe_details
    @recipes.map do |recipe|
      data = {
        id: nil,
        type: 'recipe',
        attributes: {
          title: recipe[:recipe][:label],
          url: recipe[:recipe][:url],
          country: @country,
          image: recipe[:recipe][:image]
        }
      }
    end
  end
end
