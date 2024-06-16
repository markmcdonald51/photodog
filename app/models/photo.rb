class Photo < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude

  attr_accessor :address

  # MountableLocations::City.near(photo)
  # p.map{|p1|  c << MountableLocations::City.near(p1).first.city }
end
