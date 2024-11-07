# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bike.select{|b| b[:id].even?}.each do |b|
  b.status='available'
  b.save!
end
Bike.select{|b| b[:id].odd?}.each do |b|
  b.status='service'
  b.save!
end
