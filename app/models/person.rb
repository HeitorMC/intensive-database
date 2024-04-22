# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
  has_many :articles, foreign_key: :author_id
  has_many :comments, foreign_key: :sender_id
end
