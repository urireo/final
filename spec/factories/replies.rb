FactoryBot.define do
  factory :reply do |f|
    comment_id { Faker::Number.number  }
    content { Faker::Lorem.paragraph}
    user_id { Faker::Number.number  }
    comment
    user
  end
end
