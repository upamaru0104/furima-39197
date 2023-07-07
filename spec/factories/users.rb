FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_name_reading    {Faker::Japanese::Name.first_name(only_katakana: true)}
    last_name_reading     {Faker::Japanese::Name.last_name(only_katakana: true)}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end