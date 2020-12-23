FactoryBot.define do
  factory :user do
    nickname            {Faker::Name.name}
    email               {Faker::Internet.free_email}
    encrypted_password  {Faker::Internet.password(min_length: 6)}
    first_name          {Faker::Japanese::Name.first_name}
    last_name           {Faker::Japanese::Name.last_name}
    first_name_furigana {Faker::Japanese::Name.first_name.yomi}
    last_name_furigana  {Faker::Japanese::Name.last_name.yomi}
    birthday            {Faker::Date.birthday}
  end
end