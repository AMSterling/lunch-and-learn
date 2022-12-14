class Api::V1::FavoritesController < ApplicationController
  def index
    if params[:api_key].present?
      user = User.find_by(api_key: params[:api_key])
      if !user.present?
        render json: { errors: 'Missing parameter or invalid API key' }, status: 400
      else
        favorites = user.favorites
        render json: FavoriteSerializer.new(favorites), status: 200
      end
    else
      render json: { errors: 'Missing parameter' }, status: 400
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      new_favorite = Favorite.new(favorite_params)
      new_favorite.user_id = user.id
      new_favorite.save
      render json: { success: 'Favorite added successfully' }, status: 201
    else
      render json: { errors: 'Missing parameter or invalid API key' }, status: 400
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end
