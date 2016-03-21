class Api::V1::RecipesController < ApplicationController
  before_action :authenticate_chef!, except: [:index, :show]
  before_action :get_recipe, only: [:show]

  def index
    render json: Recipe.order(created_at: :desc)
  end

  def show
    render json: get_recipe
  end

  def search
    recipes = params[:keywords] ? Recipe.where('name ilike ?',"%#{params[:keywords]}%") : []
    render json: recipes
  end

  private

  def get_recipe
    Recipe.find_by(id: params[:id])
  end
end