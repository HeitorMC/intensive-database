# == Schema Information
#
# Table name: reactions
#
#  id                :bigint           not null, primary key
#  kind              :string
#  reactionable_type :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  person_id         :bigint           not null
#  reactionable_id   :bigint           not null
#
# Indexes
#
#  index_reactions_on_person_id     (person_id)
#  index_reactions_on_reactionable  (reactionable_type,reactionable_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#
class Reaction < ApplicationRecord
  belongs_to :reactionable, polymorphic: true

  enum kind: { loved: 'loved', hated: 'hated' }

  validates :kind, presence: true, inclusion: { in: kinds.keys }
end
