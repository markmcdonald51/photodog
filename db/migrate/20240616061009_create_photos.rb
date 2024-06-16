class CreatePhotos < ActiveRecord::Migration[7.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.decimal :latitude
      t.decimal :longitude
      t.integer :image_views
      t.datetime :photo_taken_time
      t.string :url
      t.text :description
      t.string :device_type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
