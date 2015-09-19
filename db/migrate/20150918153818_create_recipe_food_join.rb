class CreateRecipeFoodJoin < ActiveRecord::Migration
  def change
    create_table :recipe_food_joins do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true
      t.references :weight, index: true, foreign_key: true
      t.float :amount
    end
  end
end
