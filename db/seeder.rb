# frozen_string_literal: true

class Seeder
  def initialize(*klasses)
    @klasses = klasses
  end

  def seed!
    @klasses.each { |klass| send(:"seed_#{klass.table_name}!") }
  end

  def seed_people!
    return if skip?(Person)

    print_stout '- Seeding People'
    total_people = rand(500..1_000)
    people_attributes = FactoryBot.attributes_for_list(:person, total_people)

    @person_ids = batch_insert!(people_attributes, Person)
  end

  def seed_articles!
    return if skip?(Article)

    print_stout '- Seeding Articles'
    total_articles = person_ids.count * rand(2..3)
    articles_attributes = FactoryBot.attributes_for_list(:article, total_articles).map do |attributes|
      attributes.merge(author_id: person_ids.sample)
    end

    @article_ids = batch_insert!(articles_attributes, Article)
  end

  def seed_comments!
    return if skip?(Comment)

    print_stout '- Seeding Comments'
    total_comments = article_ids.count * rand(3..5)
    comments_attributes = FactoryBot.attributes_for_list(:comment, total_comments).map do |attributes|
      attributes.merge(article_id: article_ids.sample, sender_id: person_ids.sample)
    end

    @comment_ids = batch_insert!(comments_attributes, Comment)
  end

  def seed_reactions! # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    return if skip?(Reaction)

    print_stout '- Seeding Reactions'
    total_reactions = (person_count + article_count + comment_count) * rand(2..3)
    reaction_attributes =
      FactoryBot.attributes_for_list(:reaction, total_reactions, reactionable: nil).map do |attributes|
        person_id = person_ids.sample
        reactionable_id, reactionable_type =
          [
            [person_ids.sample, Person],
            [article_ids.sample, Article],
            [comment_ids.sample, Comment]
          ].sample

        attributes.merge(person_id:, reactionable_id:, reactionable_type:).compact
      end

    @reaction_ids = batch_insert!(reaction_attributes, Reaction)
  end

  private

  def person_ids
    @person_ids ||= Person.pluck(:id)
  end

  def person_count
    @person_count ||= person_ids.count
  end

  def article_ids
    @article_ids ||= Article.pluck(:id)
  end

  def article_count
    @article_count ||= article_ids.count
  end

  def comment_ids
    @comment_ids ||= Comment.pluck(:id)
  end

  def comment_count
    @comment_count ||= comment_ids.count
  end

  def reaction_ids
    @reaction_ids ||= Reaction.pluck(:id)
  end

  def reaction_count
    @reaction_count ||= reaction_ids.count
  end

  def batch_insert!(attributes_list, klass, batch_size: 1_000)
    print_stout "Total of \"#{klass}\" records: #{attributes_list.count}"

    attributes_list.each_slice(batch_size).flat_map do |attributes_slice|
      print_stout "Inserting a batch of #{attributes_slice.count} records"
      klass.insert_all!(attributes_slice).pluck('id') # rubocop:disable Rails/SkipsModelValidations
    end
  end

  def skip?(klass)
    if klass.any?
      print_stout "Skipping #{klass}, #{klass.table_name} table is populated already."
      return true
    end

    false
  end

  def print_stout(message)
    puts message # rubocop:disable Rails/Output
  end
end
