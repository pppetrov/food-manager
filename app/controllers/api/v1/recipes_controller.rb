class Api::V1::RecipesController < ApplicationController
  
  respond_to :html, :json
  
  def index
    @current_user = User.find(1);
    @recipes = @current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = @current_user.id
    recipe.save
    id = recipe.id
    params[:recipe_food_joins].each do |join|
      join[:recipe_id] = id
      RecipeFoodJoin.create(join.permit(:food_id, :weight_id, :amount, :recipe_id))
    end
    
    RecipeFoodJoin.where(recipe_id: id).each do |food|
      grams = Weight.find(food.weight_id).gram_weight /  Weight.find(food.weight_id).amount * food.amount
      Nutrition.where(food_id: food.food_id).each do |nutrition|
        currentAmount = nutrition.amount * grams / 100
        entry = RecipeNutrientJoin.find_or_create_by(recipe_id: id, nutrient_id: nutrition.nutrient_id);
        entry.update_attribute(:amount, entry.amount + currentAmount)
      end
    end
    render json: recipe.as_json(only: [:id, :name])
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
