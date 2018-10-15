class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, dependent: :destroy
  validates :content, presence: true, alow_blank: false
  validates :author, presence: true, format: { with: /..{2}.*?\s..{2}.*?\.\z/ }
end
