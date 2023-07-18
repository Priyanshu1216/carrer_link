require 'faker'

FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    salary { Faker::Number.number(digits: 6).to_s + ' lpa' }
    experience { Faker::Number.between(from: 1, to: 10).to_s + ' years' }
    location { Faker::Address.full_address }
    skillset { Faker::ProgrammingLanguage.name + ', ' + Faker::ProgrammingLanguage.name }
    association :category
    association :user
  end
end
