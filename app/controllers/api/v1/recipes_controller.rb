class Api::V1::RecipesController < ApplicationController
  before_filter :authorize
  
  respond_to :html, :json
  
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def new
  end

  
  
end
