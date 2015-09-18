class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
    end
  end
end
