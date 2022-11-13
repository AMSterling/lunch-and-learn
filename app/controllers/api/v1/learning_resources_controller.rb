class Api::V1::LearningResourcesController < ApplicationController
  def index
    media = LearningResourceFacade.media_by_country(params[:country])
    render json: LearningResourceSerializer.new(media), status: status
  end
end
