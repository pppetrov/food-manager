class Api::V1::WeightsController < ApplicationController
  def index
    @weights = Food.find(params[:food_id]).weights
    render json: @weights.as_json()                         
  end
end
