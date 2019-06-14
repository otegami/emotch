FactoryBot.define do
  factory :tweet do
    content { "MyText" }
    association :user, factory: :user
  end
  factory :orange, class: Tweet do
    content { "I just ate an orange!" }
    created_at { 10.minutes.ago }
    association :user, factory: :user
  end
  factory :tau_manifesto, class: Tweet do
    content { "Check out the @tauday" }
    created_at { 3.years.ago }
    association :user, factory: :user
  end
  factory :cat_video, class: Tweet do
    content { "Sad cats are sad" }
    created_at { 2.hours.ago }
    association :user, factory: :user
  end
  factory :most_recent, class: Tweet do
    content { "Writing a short test" }
    created_at { Time.zone.now }
    association :user, factory: :user
  end
end
