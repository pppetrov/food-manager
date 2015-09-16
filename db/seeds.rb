# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

csv_text = File.read('./db/initial/FD_GROUP.txt')

csv = CSV.parse(csv_text, col_sep: "^")
csv.each do |row|
  FoodGroup.create!({id: row[0], name: row[1]})
end
