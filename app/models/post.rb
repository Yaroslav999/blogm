class Post < ApplicationRecord
  paginates_per 4
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :delete_all
  mount_uploader :image, ImageUploader
  validates :content, presence: { message: 'Заполните текст поста' }
  validates :name, presence: true, format: { with: /..{2}.*?\s..{2}.*?\./,
             message: 'Вы неправильно ввели название поста, имя должно состоять с двух слов в конце точка. Пример: БМВ Е30.' }
  validates :category_id, presence: { message: 'Выбирете категорию, если нет категорий, можете создать в разделе категории' }
end
