class Api::V1::FoodsController < ApplicationController
  respond_to :html, :json

  def index
    response = []
    RecipeFoodJoin.where(recipe_id: params[:recipe_id]).each do |join|
      entry = {}
      entry[:name] = Food.find(join.food_id).long_desc
      entry[:amount] = join.amount
      entry[:weight] = Weight.find(join.weight_id).description
      response.push(entry)
    end
    # binding.pry
    render json: response
  end

  def show
    @food = Food.find_by(params[:id])
    render json: @food.as_json
  end
  
  def search
    @matches = Food.search_by_desc(params[:query]).limit(10);
    render json: @matches.as_json()
  end
end
