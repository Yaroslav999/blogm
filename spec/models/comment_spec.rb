require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations comments' do
    it 'false in category' do
      category = Category.new(name: 'First category.', description: 'Text ....').save
      comment = Comment.new(author: 'First author', content: 'First content', commentable_type: category).save
      expect(comment).to eq(false)
    end
  end
end
