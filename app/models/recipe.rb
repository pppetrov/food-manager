class Recipe < ActiveRecord::Base

  
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :recipe_nutrion_joins
  has_many :nutrients, through: :recipe_nutrient_joins
  has_many :recipe_food_joins
  has_many :foods, through: :recipe_food_joins


end
