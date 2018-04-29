FactoryGirl.define do
  factory :stock do
    name 'Stock Company 1'
    bearer {FactoryGirl.build(:bearer)}
    market_price {FactoryGirl.build(:first_market_price)}

    trait :deleted_stock do
      deleted_at "2018-04-29 07:04:32"
    end
    factory :deleted_stock,  :traits => [:deleted_stock]
  end

  factory :second_stock, class: Stock do
    name "Stock Company 2"
    bearer {FactoryGirl.build(:bearer)}
    market_price {FactoryGirl.build(:second_market_price)}
  end
end
