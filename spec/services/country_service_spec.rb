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

  it 'returns array with message if search is left empty' do
    nonexistent = CountryService.get_country('')

    expect(nonexistent).to be_an Array
    expect(nonexistent).to eq([:message, "Page Not Found"])
  end

  it 'returns bad status if no country matches user input' do

    fake_country = CountryService.get_country('chicken')

    expect(fake_country).to be_an Array
    expect(fake_country).to eq([:status, 404])
  end

  it 'parameterizes country names that have non ASCII characters' do
    allow(CountryService).to receive(:get_random_country).and_return('São Tomé and Príncipe')
    random = CountryService.get_random_country.parameterize(preserve_case: true, separator: ' ')

    expect(random).to eq('Sao Tome and Principe')
  end
end
