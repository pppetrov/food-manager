class CreateNutrient < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.string :unit
      t.string :tagname
      t.string :name
      t.string :num_decimal_places
      t.integer :sr_order
    end
  end
end
