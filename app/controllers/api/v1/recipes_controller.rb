class Api::RecipesController < ApplicationController
  def index
    render json: Recipe.order(created_at: :desc)
  end

  def search
    recipes = params[:keywords] ? Recipe.where('name ilike ?',"%#{params[:keywords]}%") : []
    render json: recipes
  end
end