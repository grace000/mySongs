FactoryBot.define do
  factory :post do
    title { Faker::Hipster.sentence }
    artist { Faker::Hipster.sentence }
    url { Faker::Hipster.sentence }
    association(:user)
  end
end
