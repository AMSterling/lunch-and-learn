class Api::V1::TouristSightsController < ApplicationController
  def index
    @country = CountryFacade.country_details(params[:country])
  end
end
