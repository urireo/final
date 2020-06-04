require 'faker'

FactoryBot.define do

# post factory with a `belongs_to` association for the user
  factory :post do  |f|
     f.title {Faker::Lorem.word}
     f.content { Faker::Lorem.paragraph}
     f.user_id { Faker::Number.number }
     user
   end
end
