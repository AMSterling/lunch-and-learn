class TouristSightFacade
  def self.capital_sights(country)
    @sights = GeoapifyService.get_sights(CountryFacade.country_details(country))

    sight_details
  end

  def self.sight_details
    @sights.map do |sight|
      data = {
        id: nil,
        type: 'tourist_sight',
        attributes: {
          name: sight[:properties][:name],
          address: sight[:properties][:formatted],
          place_id: sight[:properties][:place_id]
        }
      }
    end
  end
end
