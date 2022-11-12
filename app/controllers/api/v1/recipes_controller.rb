class Api::V1::RecipesController < ApplicationController
  def index
    recipes = RecipeFacade.recipes_from_country(params[:country])
    render json: RecipeSerializer.new(recipes), status: status
  end
end
