require 'rails_helper'

RSpec.describe 'Recipe Resquest', :vcr do
  it 'retrieves recipes for a specified country' do
    country = ('thailand')

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    recipes = response_body[:data]

    expect(recipes.count).to eq 10
    expect(recipes).to be_an Array
    recipes.each do |recipe|
      expect(recipe).to_not have_key(:table)
      expect(recipe.keys).to eq([:id, :type, :attributes])
      expect(recipe[:id]).to eq nil
      expect(recipe[:type]).to eq('recipe')
      expect(recipe[:attributes]).to_not have_key(:id)
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image])
      expect(recipe[:attributes].values).to be_all String
      recipe[:attributes].values.each do |value|
        expect(value).to be_a String
      end
      expect(recipe[:attributes][:country]).to eq('Thailand')
    end
  end

  it 'receives an empty array if no country matches' do
    country = ('chicken')

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to eq({:data=>[]})
  end

  it 'retrieves an empty array if country is left blank' do
    country = ''

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to eq({:data=>[]})
  end

  it 'retrieves recipes from a random country whose name included special characters' do
    allow(CountryService).to receive(:get_random_country).and_return('Curaçao')
    random = CountryService.get_random_country.parameterize(preserve_case: true, separator: ' ')

    get "/api/v1/recipes?country=#{random}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    recipes = response_body[:data]

    expect(recipes.count).to eq 10
    expect(recipes).to be_an Array
    recipes.each do |recipe|
      expect(recipe).to_not have_key(:table)
      expect(recipe.keys).to eq([:id, :type, :attributes])
      expect(recipe[:id]).to eq nil
      expect(recipe[:type]).to eq('recipe')
      expect(recipe[:attributes]).to_not have_key(:id)
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image])
      expect(recipe[:attributes].values).to be_all String
      recipe[:attributes].values.each do |value|
        expect(value).to be_a String
      end
      expect(recipe[:attributes][:country]).to eq('Curacao')
    end
  end

  it 'retrieves recipes from a random country' do
    allow(CountryService).to receive(:get_random_country).and_return('Greece')
    random = CountryService.get_random_country
    RecipeFacade.randomized

    get "/api/v1/recipes?"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    recipes = response_body[:data]

    expect(recipes.count).to eq 10
    expect(recipes).to be_an Array
    recipes.each do |recipe|
      expect(recipe).to_not have_key(:table)
      expect(recipe.keys).to eq([:id, :type, :attributes])
      expect(recipe[:id]).to eq nil
      expect(recipe[:type]).to eq('recipe')
      expect(recipe[:attributes]).to_not have_key(:id)
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image])
      expect(recipe[:attributes].values).to be_all String
      recipe[:attributes].values.each do |value|
        expect(value).to be_a String
      end
      expect(recipe[:attributes][:country]).to eq('Greece')
    end
  end

  it 'returns empty data when no recipes for randomized country' do
    allow(CountryService).to receive(:get_random_country).and_return('Sao Tome and Principe')
    random = CountryService.get_random_country
    RecipeFacade.randomized

    get "/api/v1/recipes?"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to eq({:data=>['message', 'No recipes for Sao Tome and Principe']})
  end

  it 'returns empty data when no recipes for valid country' do
    country = 'Guinea-Bissau'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to eq({:data=>['message', 'No recipes for Guinea-Bissau']})
  end

  it 'returns empty data when no recipes for Kyrgyzstan' do
    country = 'Kyrgyzstan'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to eq({:data=>['message', 'No recipes for Kyrgyzstan']})
  end

  it 'returns empty data when no recipes for Djibouti' do
    country = 'Djibouti'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to eq({:data=>['message', 'No recipes for Djibouti']})
  end
end
