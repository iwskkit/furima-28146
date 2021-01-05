FactoryBot.define do
  factory :address do
    postal_code {"123-1232"}
    prefecture_id {"3"}
    municipality {"東京都渋谷区"}
    house_number {"1234"}
    phone_number {"12345678890"}
  end
end
