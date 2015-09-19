class CreateRecipeNutritionJoin < ActiveRecord::Migration
  def change
    create_table :recipe_nutrition_joins do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :nutrient, index: true, foreign_key: true
      t.float :amount
    end
  end
end
