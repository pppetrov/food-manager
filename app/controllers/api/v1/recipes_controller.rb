class Api::V1::RecipesController < ApplicationController
  before_filter :authorize
  
  respond_to :html, :json
  
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.create(recipe_params)
    id = recipe.id
    params[:recipe_food_joins].each do |join|
      join[:recipe_id] = id
      RecipeFoodJoin.create(join.permit(:food_id, :weight_id, :amount, :recipe_id))
    end
    
    RecipeFoodJoin.where(recipe_id: id).each do |food|
      grams = Weight.find(food.weight_id).gram_weight * food.amount
      Nutrition.where(food_id: food.food_id).each do |nutrition|
        currentAmount = nutrition.amount * grams / 100
        entry = RecipeNutrientJoin.find_or_create_by(recipe_id: id, nutrient_id: nutrition.nutrient_id);
        entry.update_attribute(:amount, entry.amount + currentAmount)
      end
    end


  end

  def update
  end

  def destroy
  end

  def new
  end

  private

  def recipe_params
    params
      .permit(:name)
  end

  def food_joins_params
    params
      .permit(:recipe_food_joins)
  end
  
end
