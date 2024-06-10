class Issue < ApplicationRecord
  belongs_to :magazine
  has_rich_text :cover
  has_many :articles
  has_many :authors, through: :articles
end
