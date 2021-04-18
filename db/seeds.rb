require 'faker'

100.times do
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


350.times do 
  tag_list = ["organic", "homegrown", "pesticide free", "non gmo", "ripe"]
  user = User.find(User.pluck(:id).sample)
  user.posts.create!(
    title: Faker::Food.vegetables,
    description: Faker::Lorem.sentence(word_count: 8),
    tags: 3.times.map{ tag_list.sample }
  )
end