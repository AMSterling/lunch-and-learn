require 'rails_helper'

RSpec.describe CountryFacade, :vcr do
  it 'returns country attributes' do
    country = CountryFacade.country_details('france')

    expect(country.name).to eq('France')
    expect(country.capital).to eq('Paris')
    expect(country.lat).to eq(48.87)
    expect(country.lng).to eq(2.33)
  end
end
