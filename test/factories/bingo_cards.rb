FactoryBot.define do
  factory :bingo_card do
    name { "bingo card" }
    columns { 5 }
    rows { 5 }
    start_date { Time.now }
    end_date { Time.now + 1.days }
  end
end
