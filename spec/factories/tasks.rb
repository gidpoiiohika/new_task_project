FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyString" }
    user_id { "" }
    list_id { "" }
    priority { 1 }
    soft_deleted { false }
  end
end
