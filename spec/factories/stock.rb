FactoryGirl.define do
  factory :stock do
    name 'Stock Company 1'
    bearer
    market_price 
  end

  factory :second_stock, class: Stock do
    name "Stock Company 2"
    bearer
    market_price
  end
end
