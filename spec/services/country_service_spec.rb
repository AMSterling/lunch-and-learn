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

  it 'returns latlng for searched capital city' do
    country = CountryService.get_country('france')

    expect(country.keys).to eq([
      :name,
      :tld,
      :cca2,
      :ccn3,
      :cca3,
      :cioc,
      :independent,
      :status,
      :unMember,
      :currencies,
      :idd,
      :capital,
      :altSpellings,
      :region,
      :subregion,
      :languages,
      :translations,
      :latlng,
      :landlocked,
      :borders,
      :area,
      :demonyms,
      :flag,
      :maps,
      :population,
      :gini,
      :fifa,
      :car,
      :timezones,
      :continents,
      :flags,
      :coatOfArms,
      :startOfWeek,
      :capitalInfo,
      :postalCode
      ])
    expect(country[:name]).to have_key(:common)
    expect(country[:name][:common]).to eq('France')
    expect(country[:latlng]).to be_an Array
    expect(country[:latlng]).to eq([46.0, 2.0])
    expect(country[:latlng][0]).to eq(46.0)
    expect(country[:latlng][1]).to eq(2.0)
    expect(country[:capital]).to be_an Array
    expect(country[:capital]).to eq(['Paris'])
    expect(country[:capital][0]).to eq('Paris')
  end
end
