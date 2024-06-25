class Device < ApplicationRecord
  validates_uniqueness_of :name
end
