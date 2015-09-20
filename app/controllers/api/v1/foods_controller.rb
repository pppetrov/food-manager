class Api::V1::FoodsController < ApplicationController
  respond_to :html, :json
  
  def search
    @matches = Food.search_by_desc(params[:query]).limit(10);
    render json: @matches
  end
  
end
