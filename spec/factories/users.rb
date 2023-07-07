FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)}
    password_confirmation {password}
    first_name            {'太郎'}
    last_name             {'佐藤'}
    first_name_reading    {'タロウ'}
    last_name_reading     {'サトウ'}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end