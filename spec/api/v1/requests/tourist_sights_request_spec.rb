require 'rails_helper'

RSpec.describe 'Tourist Sights Request', :vcr do
  it 'retrieves sights for the searched country' do
    country = 'france'

    get "/api/v1/tourist_sights?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    sights = response_body[:data]

    expect(sights).to be_an Array
    sights.each do |sight|
      expect(sight.keys).to eq([:id, :type, :attributes])
      expect(sight[:id]).to be_nil
      expect(sight[:type]).to eq('tourist_sight')
      expect(sight[:attributes].keys).to eq([:name, :address, :place_id])
      expect(sight[:attributes]).to_not have_key(:id)
      expect(sight[:attributes][:name]).to be_a String
      expect(sight[:attributes][:address]).to be_a String
      expect(sight[:attributes][:place_id]).to be_a String
    end
  end
end
