class Magazine < ApplicationRecord
  has_rich_text :description
  has_many :authors
  has_many :issues
end
