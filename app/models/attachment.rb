class Attachment < ApplicationRecord
  belongs_to :device
  belongs_to :user
  belongs_to :attachable, polymorphic: true

  reverse_geocoded_by :latitude, :longitude

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]

    #image.variant :large, resize_to_fill: [3800, 950]
    #image.variant :medium, resize_to_fill: [1900, 475]
    #image.variant :thumb, resize_to_fill: [100, 100]
  end
end
