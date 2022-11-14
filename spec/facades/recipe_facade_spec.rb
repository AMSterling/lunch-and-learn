require 'rails_helper'

RSpec.describe RecipeFacade, :vcr do
  it 'gets recipes from the searched country' do
    recipes = RecipeFacade.recipes_from_country('thailand')

    expect(recipes).to be_an Array
    expect(recipes.count).to eq 10
    recipes.each do |recipe|
      expect(recipe[:id]).to be_nil
      expect(recipe[:type]).to eq('recipe')
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes]).to_not have_key(:uri)
      expect(recipe[:attributes]).to_not have_key(:label)
      expect(recipe[:attributes]).to_not have_key(:images)
      expect(recipe[:attributes]).to_not have_key(:source)
      expect(recipe[:attributes]).to_not have_key(:shareAs)
      expect(recipe[:attributes]).to_not have_key(:yield)
      expect(recipe[:attributes]).to_not have_key(:ingredients)
      expect(recipe[:attributes]).to_not have_key(:calories)
      expect(recipe[:attributes]).to_not have_key(:cuisineType)
      expect(recipe[:attributes]).to_not have_key(:mealType)
      expect(recipe[:attributes]).to_not have_key(:dishType)
      expect(recipe[:attributes]).to_not have_key(:totalNutrients)
      expect(recipe[:attributes]).to_not have_key(:totalDaily)
      expect(recipe[:attributes]).to_not have_key(:digest)
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image])
      recipe[:attributes].values.each do |value|
        expect(value).to be_a String
      end
    end
  end

  it 'returns empty array if country is blank' do
    recipes = RecipeFacade.recipes_from_country('')

    expect(recipes).to be_an Array
    expect(recipes).to eq([])
  end

  it 'returns empty array if no country exists' do
    recipes = RecipeFacade.recipes_from_country('jfireomfjeo')

    expect(recipes).to be_an Array
    expect(recipes).to eq([])
  end

  it 'returns recipes from a randomly chosen country' do
    allow(CountryService).to receive(:get_random_country).and_return('Russia')
    recipes = RecipeFacade.randomized

    expect(recipes).to be_an Array
    recipes.each do |recipe|
      expect(recipe[:id]).to be_nil
      expect(recipe[:type]).to eq('recipe')
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes]).to_not have_key(:uri)
      expect(recipe[:attributes]).to_not have_key(:label)
      expect(recipe[:attributes]).to_not have_key(:images)
      expect(recipe[:attributes]).to_not have_key(:source)
      expect(recipe[:attributes]).to_not have_key(:shareAs)
      expect(recipe[:attributes]).to_not have_key(:yield)
      expect(recipe[:attributes]).to_not have_key(:ingredients)
      expect(recipe[:attributes]).to_not have_key(:calories)
      expect(recipe[:attributes]).to_not have_key(:cuisineType)
      expect(recipe[:attributes]).to_not have_key(:mealType)
      expect(recipe[:attributes]).to_not have_key(:dishType)
      expect(recipe[:attributes]).to_not have_key(:totalNutrients)
      expect(recipe[:attributes]).to_not have_key(:totalDaily)
      expect(recipe[:attributes]).to_not have_key(:digest)
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image])
      recipe[:attributes].values.each do |value|
        expect(value).to be_a String
      end
    end
  end

  it 'returns empty array if there are no recipes for the country' do
    allow(CountryService).to receive(:get_random_country).and_return('Sao Tome and Principe')

    recipes = RecipeFacade.randomized

    expect(recipes).to be_an Array
    expect(recipes).to eq([])
  end
end
