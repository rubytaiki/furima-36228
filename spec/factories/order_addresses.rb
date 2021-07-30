FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city_word { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08055556789' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
