class Api::V1::RecipesController < ApplicationController
  before_action :authenticate_chef!, except: [:index, :show]
  before_action :get_recipe, only: [:show]

  def index
    render json: Recipe.order(created_at: :desc)
  end

  def show
    render json: get_recipe
  end

  def new
    render json: Recipe.new
  end

  def create
    recipe_data = allowed_params
    recipe_data[:chef_id] = current_chef.id

    new_recipe = Recipe.create(recipe_data)

    if new_recipe.valid?
      head :no_content
    else
      head :bad_request
    end
  end

  def search
    recipes = params[:keywords] ? Recipe.where('name ilike ?',"%#{params[:keywords]}%") : []
    render json: recipes
  end

  private

  def get_recipe
    Recipe.find_by(id: params[:id])
  end

  def allowed_params
    params.require(:recipe).permit(:name, :by, :description, :directions, :ingredients, :source)
  end
end
