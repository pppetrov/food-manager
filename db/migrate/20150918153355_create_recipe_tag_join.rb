class CreateRecipeTagJoin < ActiveRecord::Migration
  def change
    create_table :recipe_tag_joins do |t|
      t.references :recipe, index:true, foreign_key: true
      t.references :tag, index:true, foreign_key: true
    end
  end
end
