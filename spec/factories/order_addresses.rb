FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id     {2}
    city { '東京都' }
    house_number { '1-1' }
    phone_number { '00000000000' }
  end
end