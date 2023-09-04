FactoryBot.define do
  factory :item do
    name{"テストサンプル"}
    explanation{"テストサンプル説明"}
    category_id{5}
    condition_id{4}
    delivery_charge_id{2}
    prefecture_id{3}
    delivery_day_id{2}
    price{1000}

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      item.images.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
