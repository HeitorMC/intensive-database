class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
      t.references :author, null: false, foreign_key: { to_table: :people }
    end
  end
end
