FactoryBot.define do
  factory :user do
    name    {Faker::Name.initials(number: 2)}
    email   {Faker::Internet.email}
    password { '1abcdef'}
    first_name { '山田' }
    last_name { '太郎' }
    kanafirst_name { 'テスト' }
    kanalast_name { 'ユーザー' }
    birthday { Faker::Date.birthday(min_age: 1, max_age: 120) }
    password_confirmation {'1abcdef'}
  end
end
