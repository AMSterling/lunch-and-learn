require 'rails_helper'

RSpec.describe Country, :vcr do
  it 'exists with attributes' do
    country = Country.new(CountryService.get_country('france'))

    expect(country.id). to eq(nil)
    expect(country.name).to eq('France')
    expect(country.capital).to eq('Paris')
    expect(country.lat).to eq(48.87)
    expect(country.lng).to eq(2.33)
  end
end
