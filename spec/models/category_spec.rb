require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations category' do
    it 'when in name missing dot' do
      category = Category.new(name: 'First category').save
      expect(category).to eq(false)
    end

    it 'when words have 2 letter' do
      category = Category.new(name: 'First ca.').save
      expect(category).to eq(false)
    end

    it 'when we get 1 word' do
      category = Category.new(name: 'First.').save
      expect(category).to eq(false)
    end

    it 'normal category' do
      category = Category.new(name: 'First category.', description: 'Text ....').save
      expect(category).to eq(true)
    end
  end
end
