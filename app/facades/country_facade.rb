class CountryFacade
  def self.country_details(country)
    details = CountryService.get_country(country)
      Country.new(details)
  end
end
