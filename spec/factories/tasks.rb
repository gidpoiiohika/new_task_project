FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "title-#{n}"  }
    sequence(:description) { |n| "description-#{n}"  }
    user_id { create(:user) }
    list_id { create(:list) }
    priority { 1 }
    soft_deleted { false }
  end
end
