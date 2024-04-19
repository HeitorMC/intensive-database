# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    article
    sender factory: :person
    body { Faker::Quote.famous_last_words }
  end
end
