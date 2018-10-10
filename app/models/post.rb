class Post < ApplicationRecord
  paginates_per 4
  belongs_to :category
  mount_uploader :image, ImageUploader
end
