require 'rails_helper'

RSpec.describe GeoapifyService, :vcr do
  it 'returns tourism sites from country' do
    sights = GeoapifyService.get_sights(CountryFacade.country_details('france'))

    expect(sights.count).to eq 20
    sights.each do |sight|
      expect(sight.keys).to eq([:type, :properties, :geometry])
      expect(sight[:properties].keys).to include(:name, :formatted, :place_id)
      expect(sight[:properties]).to have_key(:name)
      expect(sight[:properties]).to have_key(:formatted)
      expect(sight[:properties]).to have_key(:place_id)
      expect(sight[:properties][:name]).to be_a String
      expect(sight[:properties][:formatted]).to be_a String
      expect(sight[:properties][:place_id]).to be_a String
    end
  end
end
