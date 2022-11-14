class Api::V1::TouristSightsController < ApplicationController
  def index
    sights = TouristSightFacade.capital_sights(params[:country])
    render json: TouristSightSerializer.new(sights), status: status
  end
end
