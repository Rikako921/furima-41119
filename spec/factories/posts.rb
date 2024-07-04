FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    contents { 'コンテンツ' }
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    prefecture_id { 2 }
    schedule_id { 2 }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('spec/fixtures/files/tani.jpg'), filename: 'tani.jpg', content_type: 'files/jpg')
    end
  end
end