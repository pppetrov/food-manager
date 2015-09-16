class CreateFoodGroup < ActiveRecord::Migration
  def change
    create_table :food_groups do |t|
      t.string :name
    end
  end
end
