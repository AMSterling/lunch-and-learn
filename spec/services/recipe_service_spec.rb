require 'rails_helper'

RSpec.describe RecipeService, :vcr do
  it 'returns recipes from a country' do
    recipes = RecipeService.get_recipe_by_country('thailand')

    expect(recipes).to be_an Array
    expect(recipes.count).to eq 10
    recipes.each do |recipe|
      expect(recipe.keys).to eq([:recipe, :_links])
      expect(recipe[:recipe].keys).to eq([
        :uri,
        :label,
        :image,
        :images,
        :source,
        :url,
        :shareAs,
        :yield,
        :dietLabels,
        :healthLabels,
        :cautions,
        :ingredientLines,
        :ingredients,
        :calories,
        :totalWeight,
        :totalTime,
        :cuisineType,
        :mealType,
        :dishType,
        :totalNutrients,
        :totalDaily,
        :digest
        ])
      expect(recipe[:recipe][:url]).to be_a String
      expect(recipe[:recipe][:label]).to be_a String
      expect(recipe[:recipe][:image]).to be_a String
      expect(recipe[:recipe][:images]).to be_a Hash
    end
  end
end
