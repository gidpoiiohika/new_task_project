FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "Ruby-#{n}" }
    sequence(:last_name)  { |n| "Rails-#{n}" }
    email { "doctodEmail@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
