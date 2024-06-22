class CreateAttachments < ActiveRecord::Migration[7.2]
  def change
    create_table :attachments do |t|
      t.string :title
      t.decimal :altitude
      t.decimal :latitude
      t.decimal :longitude
      t.integer :image_views
      t.datetime :photo_taken_time
      t.string :url
      t.text :description
      t.belongs_to :device #, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.references :attachable, polymorphic: true #, null: false
      t.string :type

      t.timestamps
    end
  end
end
