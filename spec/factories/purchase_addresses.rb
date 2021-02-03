FactoryBot.define do
  zip_code_head = Faker::Number.number(digits: 3)
  zip_code_tale = Faker::Number.number(digits: 4)

  factory :purchase_address do
    token     {"tok_abcdefghijk00000000000000000"}
    zip_code  { "#{zip_code_head}-#{zip_code_tale}" }
    pref_id   { Faker::Number.between(from: 2, to: 48) }
    city      { Faker::Address.city }
    chome     { Faker::Address.street_address }
    bldg      { Faker::Address.building_number }
    tel       { Faker::Number.leading_zero_number(digits: 11) }
  end
end
