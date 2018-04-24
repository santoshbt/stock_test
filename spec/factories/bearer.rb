FactoryGirl.define do
  factory :bearer do
    name 'John'
  end

  factory :second_bearer, class: Bearer do
    name 'Peter'
  end
end
