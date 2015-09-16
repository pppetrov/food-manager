class CreateNutrition < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.references :food, index: true
      t.references :nutrient, index: true
      t.float :amount
      t.integer :num_data_points
      t.float :std_error
      t.string :source_code
      t.string :derivation_code
      t.references :food, index: {name: 'reference_food_id'}
      t.string :added_nutrient
      t.float :min
      t.float :max
      t.integer :degrees_freedom
      t.float :lower_error_bound
      t.float :upper_error_bound
      t.string :comments
      t.string :modification_date
      t.string :confidence_code
    end
  end
end
