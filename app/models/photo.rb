class Photo < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]

    #image.variant :large, resize_to_fill: [3800, 950]
    #image.variant :medium, resize_to_fill: [1900, 475]
    #image.variant :thumb, resize_to_fill: [100, 100]
  end
  
  attr_accessor :address



=begin  

    if poster_images.present?
      db_poster_medium = URI.open(poster_images.third)
      self.poster.attach(io: db_poster_medium   , filename: "medium.jpg")
    end

<!-- MiniMagick -->
<%= image_tag user.avatar.variant(resize_to_limit: [100, 100], format: :jpeg, sampling_factor: "4:2:0", strip: true, interlace: "JPEG", colorspace: "sRGB", quality: 80) %>

<!-- Vips -->
<%= image_tag user.avatar.variant(resize_to_limit: [100, 100], format: :jpeg, saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 }) %>



Removing Files

To remove an attachment from a model, call purge on the attachment. If your application is set up to use Active Job, removal can be done in the background instead by calling purge_later. Purging deletes the blob and the file from the storage service.

# Synchronously destroy the avatar and actual resource files.
user.avatar.purge

=end

  # MountableLocations::City.near(photo)
  # p.map{|p1|  c << MountableLocations::City.near(p1).first.city }
end
