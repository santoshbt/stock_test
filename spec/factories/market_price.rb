FactoryGirl.define do
  factory :market_price do
    value_cents 1939
    currency "EUR"
  end

  factory :second_market_price, class: MarketPrice do
    value_cents 2530
    currency "USD"
  end

end
