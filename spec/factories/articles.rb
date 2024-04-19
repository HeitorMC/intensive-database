# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    author factory: :person
    title { Faker::Book.title }
    body { Faker::Lorem.sentence(word_count: rand(100..500)) }
  end
end
