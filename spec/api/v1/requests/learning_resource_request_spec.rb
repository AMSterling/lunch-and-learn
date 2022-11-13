require 'rails_helper'

RSpec.describe 'Learning Resource' do
  it 'retrieves videos on the selected country' do
    recipes = RecipeFacade.recipes_from_country('laos')
    country = recipes[0][:attributes][:country]

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
  end
end
