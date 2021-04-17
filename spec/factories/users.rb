FactoryBot.define do
  factory :user do
    random_password = Faker::Internet.password(min_length: 10, max_length: 20)
    username { Faker::Internet.username }
    password { random_password }
    password_confirmation { random_password }
    city { "Denver" }
    zip_code { "80212" }
    state { "Colorado" }
  end
end