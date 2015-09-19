class CreateFood < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.references :food_group, index: true, foreign_key: true
      t.string :long_desc
      t.string :short_desc
      t.string :common_names
      t.string :manufac_name
      t.string :survey_text
      t.string :ref_desc
      t.string :refuse
      t.string :sci_name
      t.float  :nitrogen_factor
      t.float  :protein_factor
      t.float  :fat_factor
      t.float  :calorie_factor
    end
  end
end
