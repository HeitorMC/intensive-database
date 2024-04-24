module DayTwo
  module Comments
    class Create < ApplicationQuery
      def call
        create_with_ar
      end

      private

      def create_with_ar
        Comment.transaction do
          comment = Comment.create(comments_attributes)
          Reaction.create(reactions_attributes(comment))
        end
      end


      ###params doesnt work for some reason
      def create_with_raw_sql
        ActiveRecord::Base.transaction do
          execute_query(load_query('day_two/task_1_1.sql'), [Faker::Quote.famous_last_words, article_ids.sample, person_ids.sample])
        end
      end

      def person_ids
        @person_ids ||= Person.pluck(:id)
      end

      def article_ids
        @article_ids ||= Article.pluck(:id)
      end

      def comments_attributes
        FactoryBot.attributes_for(:comment).merge(article_id: article_ids.sample, sender_id: person_ids.sample)
      end

      def reactions_attributes(comment)
        [
          {
            kind: Reaction.kinds.keys.sample,
            person_id: comment.sender_id,
            reactionable_id: comment.id,
            reactionable_type: Comment
          },
          {
            kind: Reaction.kinds.keys.sample,
            person_id: comment.sender_id,
            reactionable_id: comment.article_id,
            reactionable_type: Article

          }
        ]
      end
    end
  end
end
