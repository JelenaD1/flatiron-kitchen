class IngredientsController < ApplicationController
  before_action :find_ingredient_id, only: [:edit, :update]

  def index
    @ingredients = Ingredient.all
  end 

  def new
    @ingredient = Ingredient.new  
  end 

  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end 
  end 

  def edit
  end 

  def update
   if  @ingredient.update(ingredients_params)
    flash[:success] = "Ingredient updated!"
    redirect_to ingredients_path
    else 
      render :edit
    end 
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end 

  def find_ingredient_id
    @ingredient = Ingredient.find(params[:id])
  end 
end
