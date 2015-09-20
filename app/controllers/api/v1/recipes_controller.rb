class Api::V1::RecipesController < ApplicationController
  before_filter :authorize
  
  respond_to :html, :json
  
  def index
    if @current_user
        @recipes = @current_user.recipes
    end
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
