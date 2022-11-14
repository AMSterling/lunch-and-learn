class RecipeFacade
  def self.randomized
    random_country = CountryService.get_random_country
    @recipes = RecipeService.get_recipe_by_country(@country = random_country)
      if @recipes.present?
        recipe_details
      else
        []
      end
  end

  def self.recipes_from_country(searched_country)
    case
    when searched_country
      country_result = CountryService.get_country(searched_country)
      if country_result == [:message, "Page Not Found"]
        []
      elsif country_result == [:status, 404]
        []
      else
        valid_country = country_result[:name][:common].parameterize(preserve_case: true)
        @recipes = RecipeService.get_recipe_by_country(@country = valid_country)
          if @recipes.present?
            recipe_details
          else
            []
          end
      end
    else
      self.randomized
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
