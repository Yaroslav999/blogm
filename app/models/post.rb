class Post < ApplicationRecord
  paginates_per 4
  belongs_to :category
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
