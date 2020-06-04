require 'faker'

FactoryBot.define do

  factory :user do |f|
    f.name { Faker::Name.name[3..20]  }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(min_length: 6, max_length: 20) }
  end
end
