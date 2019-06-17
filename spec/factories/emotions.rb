FactoryBot.define do
  factory :emotion do
    association :tweet, factory: :tweet
    association :user, factory: :user
  end
end
