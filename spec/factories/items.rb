FactoryBot.define do
  factory :item do
    name{Faker::Name.initials(number: 2)}
    explanation{Faker::Lorem.sentence}
    category{Category.where.not(id: 1).sample }
    condition{Condition.where.not(id: 1).sample}
    delivery_charge{DeliveryCharge.where.not(id: 1).sample}
    prefecture{Prefecture.where.not(id: 1).sample}
    delivery_day{DeliveryDay.where.not(id: 1).sample}
    price{Faker::Number.number(digits: 4)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
