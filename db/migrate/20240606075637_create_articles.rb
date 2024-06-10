class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.belongs_to :issue, null: false, foreign_key: true
      t.string :title
      t.text :tagline
      t.belongs_to :author, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
