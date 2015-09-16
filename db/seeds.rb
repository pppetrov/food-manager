# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

CSV.foreach("./db/initial/FD_GROUP.txt", col_sep: "^") do |row|
  FoodGroup.create!(Hash[FoodGroup.column_names.zip row])
end

CSV.foreach("./db/initial/FOOD_DES.txt", col_sep: "^", quote_char:"\x00") do |row|
  Food.create!(Hash[Food.column_names.zip row])
end

CSV.foreach("./db/initial/NUTR_DEF.txt", col_sep: "^", quote_char:"\x00") do |row|
  Nutrient.create!(Hash[Nutrient.column_names.zip row])
end

columns = Nutrition.column_names

columns.shift

CSV.foreach("./db/initial/NUT_DATA.txt", col_sep: "^", quote_char:"\x00") do |row|
  puts row.to_s
  Nutrition.create!(Hash[columns.zip row])
end



