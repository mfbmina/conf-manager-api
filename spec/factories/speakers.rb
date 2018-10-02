FactoryBot.define do
  factory :speaker do
    name { Faker::GameOfThrones.character }
    company { Faker::GameOfThrones.house }
    email { Faker::Internet.email }
    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-avatar.png'), 'image/png') }
    end
  end
end