require 'rails_helper'

RSpec.describe TouristSightFacade, :vcr do
  it 'gets tourist sites from the capital of the searched country' do
    sights = TouristSightFacade.capital_sights('france')

    expect(sights).to be_an Array
    sights.each do |sight|
      expect(sight.keys).to eq([:id, :type, :attributes])
      expect(sight[:id]).to be_nil
      expect(sight[:type]).to eq('tourist_sight')
      expect(sight[:attributes].keys).to eq([:name, :address, :place_id])
      expect(sight[:attributes][:name]).to be_a String
      expect(sight[:attributes][:address]).to be_a String
      expect(sight[:attributes][:place_id]).to be_a String
    end
  end
end
