# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    trait :with_reviwer do
      association :reviewer, factory: :person
    end
  end
end
