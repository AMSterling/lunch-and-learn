class RecipeFacade
  def self.randomized
    random_country = CountryService.get_random_country
    @recipes = RecipeService.get_recipe_by_country(@country = random_country)
      if !@recipes.present?
        [:message, "No recipes for #{random_country}"]
      elsif @recipes.present?
        recipe_details
      end
  end

  def self.recipes_from_country(searched_country)
    return randomized unless searched_country

    country_result = CountryService.get_country(searched_country)
    return [] if country_not_found?(country_result)

    valid_country = country_result[:name][:common].parameterize(preserve_case: true, separator: ' ')
    @recipes = RecipeService.get_recipe_by_country(@country = valid_country)
    return [:message, "No recipes for #{valid_country}"] unless @recipes.present?

    recipe_details
  end

  def self.country_not_found?(country_result)
    country_result == [:message, "Page Not Found"] || country_result == [:status, 404]
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
