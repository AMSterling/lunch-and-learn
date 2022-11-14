require 'rails_helper'

RSpec.describe TouristSightFacade, :vcr do
  it 'gets tourist sites from the capital of the searched country' do
    sights = TouristSightFacade.capital_sights('france')

    expect(sights).to be_an Array
    expect(sights).to be_all TouristSight
    sights.each do |sight|
      expect(sight.name).to be_a String
      expect(sight.address).to be_a String
      expect(sight.place_id).to be_a String
    end
  end
end
