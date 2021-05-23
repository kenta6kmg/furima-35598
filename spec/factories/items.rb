FactoryBot.define do
  factory :item do
    title                {Faker::Name.initials}
    item_description     {Faker::Name.initials}
    item_category_id     {2}
    item_condition_id    {2}
    shipping_charge_id   {2}
    shipping_area_id     {2}
    day_id               {2}
    price                {300}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/furima-intro04.png'), filename: 'furima-intro04.png')
    end
  end
end
