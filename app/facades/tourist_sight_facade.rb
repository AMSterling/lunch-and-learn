class TouristSightFacade
  def self.capital_sights(country)
    sights = GeoapifyService.get_sights(CountryFacade.country_details(country))
    sights.map do |data|
      TouristSight.new(data)
    end
  end
end
