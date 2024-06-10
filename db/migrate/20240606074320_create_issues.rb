class CreateIssues < ActiveRecord::Migration[7.2]
  def change
    create_table :issues do |t|
      t.date :publish_date
      t.belongs_to :magazine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
