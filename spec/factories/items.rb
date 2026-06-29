FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { '商品の説明です' }
    price { 1000 }

    category_id { 3 }
    condition_id { 3 }
    shopping_fee_id { 3 }
    prefecture_id { 3 }
    shopping_day_id { 3 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
