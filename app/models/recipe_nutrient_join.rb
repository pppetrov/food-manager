class RecipeNutrientJoin < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :nutrient
end
