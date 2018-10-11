class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  validates :content, presence: true, alow_blank: false
end
