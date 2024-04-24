# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  sender_id  :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_sender_id   (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (sender_id => people.id)
#
class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :sender, class_name: 'Person'
  has_many :reactions, as: :reactionable, dependent: :destroy
end
