FactoryBot.define do
  factory :message do
    content { "MyText" }
    chatroom { nil }
    user { nil }
  end
end
