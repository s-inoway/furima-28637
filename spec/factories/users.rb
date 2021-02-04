FactoryBot.define do
  factory :user do
    nickname              { Faker::Games::Pokemon.name }
    email                 { Faker::Internet.free_email }
    password              { "1a" + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { "歩利間" }
    last_name             { "太郎" }
    first_name_furigana   { "フリマ" }
    last_name_furigana    { "タロウ" }
    birthday              { Faker::Date.birthday }
  end
end
