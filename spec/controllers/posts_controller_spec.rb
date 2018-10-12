require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'Get #index' do
    it 'returns a success' do
      get :index
      expect(response).to be_success
    end
  end

   context 'Get #show' do
    it 'returns a success' do
      category = Category.new(name: 'First category.', description: 'Text ....').save
      post = Post.new(name: 'First post.', content: 'Text ....', category_id: category.to_param).save
      get :show, params: { id: post.to_param }
      expect(response).to be_success
    end
  end
end
