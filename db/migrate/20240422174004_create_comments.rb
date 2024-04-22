class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body

      t.timestamps

      t.references :article, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :people }
    end
  end
end
