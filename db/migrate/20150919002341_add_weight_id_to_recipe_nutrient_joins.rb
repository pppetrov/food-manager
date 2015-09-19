class AddWeightIdToRecipeNutrientJoins < ActiveRecord::Migration
  def change
    add_reference :recipe_nutrient_joins, :weight, index: true, foreign_key: true
  end
end
