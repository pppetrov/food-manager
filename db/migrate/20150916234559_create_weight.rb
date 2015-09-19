class CreateWeight < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.references :food, index: true, foreign_key: true
      t.integer :seq
      t.integer :amount
      t.string :description
      t.float :gram_weight
      t.integer :num_data_points
      t.float :std_dev
    end
  end
end
