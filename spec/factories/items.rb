FactoryBot.define do
  factory :item do
    item_name       {"The map"}
    description     {"It's a world map that I love most"}
    price           {2000}
    category_id     {2}
    status_id       {2}
    prefecture_id   {2}
    charge_id       {2}
    shippingDate_id {2}
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/893352925-28144059336.jpg'), filename: '893352925-28144059336.jpg')
    end
  end
end
