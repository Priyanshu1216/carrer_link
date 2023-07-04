FactoryBot.define do
  factory :user do
    name { 'Bestpeers' }
    email { 'bestpeers@gmail.com' }
    password { '123456' }
    role { 'client' }
  end
end
