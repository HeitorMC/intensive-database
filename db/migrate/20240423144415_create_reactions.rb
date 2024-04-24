class CreateReactions < ActiveRecord::Migration[7.1]
  
  def change
    create_table :reactions do |t|
      t.string :kind, null: false
      t.references :person, null: false, foreign_key: true
      t.references :reactionable, polymorphic: true, null: false

      t.timestamps
    end
  end
end