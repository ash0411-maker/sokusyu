FactoryBot.define do
  factory :task do
    name { "テストタスク" }
    description { "Rspec&FactoryBot" }
    user
  end
end