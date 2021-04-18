FactoryBot.define do
  factory :post do
    user_id { User.pluck(:id).sample }
  end
end