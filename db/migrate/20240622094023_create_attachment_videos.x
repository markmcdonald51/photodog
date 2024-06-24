class CreateAttachmentVideos < ActiveRecord::Migration[7.2]
  def change
    create_table :attachment_videos do |t|
      t.string :title
      t.decimal :altitude
      t.decimal :latitude
      t.decimal :longitude
      t.integer :image_views
      t.datetime :photo_taken_time
      t.string :url
      t.text :description
      t.belongs_to :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
