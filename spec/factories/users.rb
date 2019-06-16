FactoryBot.define do
  factory :user do
    name { "michael" }
  end

  factory :other_user, class: User do
    name { "archer" }
  end
end
