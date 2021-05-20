FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               {'1a' + Faker::Internet.password}
    password_confirmation  {password}
    last_name              {'あア阿'}
    first_name             {'あア阿'}
    ruby_last              {'テスト'}
    ruby_first             {'テスト'}
    birth                  {'1000-01-01'}
  end
end
