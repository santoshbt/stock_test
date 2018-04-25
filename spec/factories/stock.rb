FactoryGirl.define do
  factory :stock do
    name 'Stock Company 1'
    bearer {FactoryGirl.build(:bearer)}
    market_price {FactoryGirl.build(:first_market_price)}
  end

  factory :second_stock, class: Stock do
    name "Stock Company 2"
    bearer {FactoryGirl.build(:bearer)}
    market_price {FactoryGirl.build(:second_market_price)}
  end
end
