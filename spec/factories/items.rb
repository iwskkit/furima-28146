FactoryBot.define do
  factory :item do
    name {Faker::Internet.username}
    detail { "商品の詳細" }
    price { "1234" }
    status_id { "2" }
    handling_time_id { "2" }
    prefecture_id { "2" }
    category_id { "2" }
    fee_burden_id { "2" }
  end
end
