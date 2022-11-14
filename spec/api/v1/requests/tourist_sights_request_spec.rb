require 'rails_helper'

RSpec.describe 'Tourist Sights Request', :vcr do
  it 'retrieves sights for the searched country' do
    country = 'france'

    get "/api/v1/tourist_sights?country=#{country}"

    expect(response).to be_successful
    # response_body = JSON.parse(response.body, symbolize_names: true)
    # sights = response_body[:data]

  end
end
