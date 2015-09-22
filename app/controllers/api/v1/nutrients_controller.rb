class Api::V1::NutrientsController < ApplicationController
  respond_to :html, :json

  def index
    response = []
    RecipeNutrientJoin.where(recipe_id: params[:recipe_id]).each do |join|
      entry = {}
      nutrient = Nutrient.find(join.nutrient_id)
      entry[:name] = nutrient.name
      entry[:unit] = nutrient.unit
      entry[:amount] = join.amount
      response.push(entry)
    end
    binding.pry
    render json: response
  end

  def show
  end
end
