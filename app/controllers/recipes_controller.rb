class RecipesController < ApplicationController
  before_action :find_recipe_id, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show

  end 

  def new
    @recipe = Recipe.new
    @all_ingredients = Ingredient.all

  end 

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end 
  end 

  def edit
    @all_ingredients = Ingredient.all
  end 

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipes updated"
      redirect_to recipes_path
    else
      render :edit
    end 
  end 

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])

  end

  def find_recipe_id
    @recipe = Recipe.find(params[:id])
  end 


end
