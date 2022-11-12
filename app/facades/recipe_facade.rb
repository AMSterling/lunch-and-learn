class RecipeFacade
  def self.recipes_from_randomized
    random_country = CountryService.get_random_country
    @recipes = RecipeService.get_recipe_by_country(@country = random_country)

    recipe_details
  end

  def self.recipes_from_country(searched_country)
    random_country = CountryService.get_random_country
    country_result = CountryService.get_country(searched_country)
    if country_result == [:message, "Page Not Found"]
      data = []
    elsif country_result == [:status, 404]
      data = []
    # elsif random_country = CountryService.get_random_country
    #   @recipes = RecipeService.get_recipe_by_country(@country = random_country)
    #
    #   recipe_details
    else
      valid_country = country_result[:name][:common]
      @recipes = RecipeService.get_recipe_by_country(@country = valid_country)

      recipe_details
    end
  end

  def self.recipe_details
    @recipes.map do |recipe|
      data = OpenStruct.new(
        {
          id: nil,
          type: 'recipe',
          attributes: {
            title: recipe[:recipe][:label],
            url: recipe[:recipe][:url],
            country: @country,
            image: recipe[:recipe][:image]
          }
        })
      data.marshal_dump.each_pair{ |key, value| puts "#{key}: #{value}" }
    end
  end
end
