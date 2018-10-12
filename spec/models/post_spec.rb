require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations post'do
    it 'check name' do
      post = Post.new(name: 'First post').save
      expect(post).to eq(false)
    end

    it 'check category_id' do
      post = Post.new(name: 'First post.', category_id: nil).save
      expect(post).to eq(false)
    end

    it 'normal post' do
      category = Category.new(name: 'First category.', description: 'Text ....').save
      post = Post.new(name: 'First post.', category_id: category.to_param).save
      expect(post).to eq(true)
    end
  end
end
