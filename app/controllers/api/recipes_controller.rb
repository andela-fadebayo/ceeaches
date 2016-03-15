class Api::RecipesController < ApplicationController
  def index
    recipes = params[:keywords] ? Recipe.where('name ilike ?',"%#{params[:keywords]}%") : []
    render json: recipes
  end
end