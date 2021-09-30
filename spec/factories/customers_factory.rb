FactoryBot.define do
  temp_name = Faker::Name.name

  factory :customer do
    name { temp_name }
    email { Faker::Internet.email(name: temp_name) }
  end
end