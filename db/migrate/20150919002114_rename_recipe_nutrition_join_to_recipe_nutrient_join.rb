class RenameRecipeNutritionJoinToRecipeNutrientJoin < ActiveRecord::Migration
  def change
    rename_table :recipe_nutrition_joins, :recipe_nutrient_joins
  end
end
