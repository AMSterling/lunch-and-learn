require 'rails_helper'

RSpec.describe CountryService, :vcr do
  it 'retrieves a country by name' do
    country = CountryService.get_country('thailand')

    expect(country).to have_key(:name)
    expect(country[:name]).to have_key(:common)
    expect(country[:name][:common]).to eq('Thailand')
  end

  it 'retrieves a random country when no argument is passed' do
    country = CountryService.get_random_country

    expect(country).to be_a String
  end

  it 'sends empty array if co country matches' do
    nonexistent = CountryService.get_country('')

    expect(nonexistent).to be_an Array
    expect(nonexistent).to eq([:message, "Page Not Found"])
  end
end
