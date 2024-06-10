class Article < ApplicationRecord
  belongs_to :issue
  belongs_to :author
  has_rich_text :content
end
