require 'rails_helper'

RSpec.describe 'Recipe Resquest', :vcr do
  it 'retrieves recipes for a specified country' do
    country = ('thailand')

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
  end
end
