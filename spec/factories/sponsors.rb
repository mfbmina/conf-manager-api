FactoryBot.define do
  factory :sponsor do
    name { Faker::GameOfThrones.character }
    tier { Faker::Number.between(1, 4) }
    website { Faker::Internet.url }
    trait :with_logo do
      logo { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-avatar.png'), 'image/png') }
    end
  end
end