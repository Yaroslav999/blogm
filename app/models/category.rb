class Category < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :posts, dependent: :destroy
  validates :name, presence: true, format: { with: /..{2}.*?\s..{2}.*?\.\z/,
             message: 'Вы неправильно ввели название категории, имя должно состоять с двух слов в конце точка. Пример: БМВ Е30.' }
end
