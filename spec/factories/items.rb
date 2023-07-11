FactoryBot.define do
  factory :item do
    name{Faker::Name.initials(number: 2)}
    explanation{"説明です"}
    category_id{"2"}
    condition_id{"2"}
    delivery_charge_id{"2"}
    delivery_day_id{"2"}
    price{Faker::Number}
  end
end
