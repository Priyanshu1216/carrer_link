require 'faker'

FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    contact { Faker::PhoneNumber.phone_number }
    dob { Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%d-%m-%Y') }
    address { Faker::Address.full_address }
    skills { Faker::ProgrammingLanguage.name + ', ' + Faker::ProgrammingLanguage.name }
    qualification { Faker::Educator.degree }
    association :user
  end
end
