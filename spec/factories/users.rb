FactoryBot.define do
  factory :user do
    user_name { "nghiatest" }
    email { "test@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
