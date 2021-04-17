require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  random_password = Faker::Internet.password(min_length: 10, max_length: 20)
  locations = { "Denver" => "80212", "Golden" => "80401", "Arvada" => "80001" , "Broomfield" => "80038", "Evergreen" => "80439", "Conifer" => "80433"}
  random_city = locations.keys.sample
  city_zip = locations[random_city]

  User.create!(
    username: Faker::Internet.username,
    password: random_password,
    password_confirmation: random_password,
    city: random_city,
    zip_code: city_zip,
    state: "Colorado"
  )
end