module DayTwo
  module Comments
    class Delete < ApplicationQuery
      def initialize(comment_id)
        super
        @comment_id = comment_id
      end

      def call
        delete_with_ar
      end

      private

      def delete_with_ar
        comment.destroy
      end

      def comment
        @comment ||= Comment.find(@comment_id)
      end
    end
  end
end
