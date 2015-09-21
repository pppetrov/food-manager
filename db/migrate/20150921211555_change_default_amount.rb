class ChangeDefaultAmount < ActiveRecord::Migration
  def up
    change_column :recipe_nutrient_joins, :amount, :float, default: 0
  end
end
