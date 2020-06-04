FactoryBot.define do
  factory :comment do  |f|
    post_id { Faker::Number.number  }
    content { Faker::Lorem.paragraph}
    user_id { Faker::Number.number  }
    post
    user
  end 
end
