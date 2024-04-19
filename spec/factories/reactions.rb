# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    person
    kind { Reaction.kinds.keys.sample }
    reactionable { build %i[article comment].sample }

    trait :hated_article do
      kind { 'hated' }
    end

    trait :loved_article do
      kind { 'loved' }
    end
  end
end
