# frozen_string_literal: true

require_relative 'seeder'

seeder = Seeder.new(
  # Person,
  # Article,
  # Comment,
  # Reaction,
)

seeder.seed!

puts "\nDone! 🎉" # rubocop:disable Rails/Output
