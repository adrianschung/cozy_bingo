FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:ign) { |n| "ign#{n}" }
    password {"passpass"}
  end
end
