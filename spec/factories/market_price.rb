FactoryGirl.define do
  factory :market_price do
    trait :first_price do
      value_cents 1578
      currency "EUR"
    end

    currency "USD"

    trait :second_price do
      value_cents 2530
    end

    trait :third_price do
      value_cents 2290
    end

    factory :first_market_price,  :traits => [:first_price]
    factory :second_market_price,  :traits => [:second_price]
    factory :third_market_price, :traits => [:third_price]
  end
end
