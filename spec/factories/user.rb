FactoryBot.define do
  factory :user do
    name { "USER_A" }
    email { "a@example.com" }
    password { "password" }
  end
end