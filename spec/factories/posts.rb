tag_list = ["organic", "homegrown", "pesticide free", "non gmo", "ripe"]

FactoryBot.define do
  factory :post do
    user_id { User.pluck(:id).sample }
    title { Faker::Lorem.words(number: 4) }
    description { Faker::Lorem.sentence(word_count: 22) }
    tags { 3.times.map{ tag_list.sample } }
  end
end