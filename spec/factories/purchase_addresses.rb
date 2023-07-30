FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture{Prefecture.where.not(id: 1).sample}
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number{ '08012345678' }
  end
end
