FactoryBot.define do
  factory :user do
    name { Faker::GameOfThrones.character }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end