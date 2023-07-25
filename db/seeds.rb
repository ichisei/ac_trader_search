# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
area_names = %w(
  東京
  神奈川
  埼玉
  千葉
)

area_names.each do |name|
  Area.create!(compatible_area: name)
end

Admin.create!(
   email: "ac@ac.com",
   password: "actsearch",
)