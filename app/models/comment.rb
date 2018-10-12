class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  validates :content, presence: true, alow_blank: false
  validates :author, presence: true, format: { with: /..{2}.*?\s..{2}.*?\.\z/,
             message: 'Вы неправильно ввели имя, оно должно состоять с двух слов в конце точка. Пример: Иванов Иван.' }
end
