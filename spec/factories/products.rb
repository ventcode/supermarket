FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    unit "kg"
  end
end
