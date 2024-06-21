class Photo < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude

  attr_accessor :address

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

=begin  

4 Removing Files

To remove an attachment from a model, call purge on the attachment. If your application is set up to use Active Job, removal can be done in the background instead by calling purge_later. Purging deletes the blob and the file from the storage service.

# Synchronously destroy the avatar and actual resource files.
user.avatar.purge

=end

  # MountableLocations::City.near(photo)
  # p.map{|p1|  c << MountableLocations::City.near(p1).first.city }
end
