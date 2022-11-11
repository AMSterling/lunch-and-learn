require 'rails_helper'

RSpec.describe 'CountryService', :vcr do
  it 'retrieves ' do
    country = CountryService.get_country('Thailand')

    expect(country).to be_an Array
    expect(country[0].keys).to eq([
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
    expect(country[0][:name].keys).to eq([:common, :official, :nativeName])
    expect(country[0][:name][:nativeName].keys).to eq([:tha])
    expect(country[0][:name][:nativeName][:tha].keys).to eq([:official, :common])
    expect(country[0][:name][:common]).to be_a String
  end
end
