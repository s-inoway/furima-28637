FactoryBot.define do
  factory :item do
    user_id        { Faker::Number.between(from: 1, to: 1000) }
    name           { Faker::Commerce.product_name }
    comment        { Faker::Lorem.sentence }
    category_id    { Faker::Number.between(from: 2, to: 11) }
    condition_id   { Faker::Number.between(from: 2, to: 7) }
    carriage_id    { Faker::Number.between(from: 2, to: 3) }
    pref_id        { Faker::Number.between(from: 2, to: 48) }
    ship_date_id   { Faker::Number.between(from: 2, to: 4) }
    price          { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
