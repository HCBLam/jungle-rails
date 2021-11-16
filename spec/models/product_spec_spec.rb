require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it 'is valid if all four fields are set' do
      @category = Category.find_by(name: 'Apparel')
      @product = Product.new(name: 'Valid', description: 'Valid item', image: 'Valid image', price: 10, quantity: 10, category_id: @category)
    end
    it 'is not valid if there is no name' do
      @category = Category.find_by(name: 'Apparel')
      @product = Product.new(description: 'No name item', image: 'No name image', price: 10, quantity: 10, category_id: @category)
    end
    it 'is not valid if there is no price' do
      @category = Category.find_by(name: 'Apparel')
      @product = Product.new(name: 'No Price', description: 'No price item', image: 'No description image', quantity: 10, category_id: @category)
    end
    it 'is not valid if there is no quantity' do
      @category = Category.find_by(name: 'Apparel')
      @product = Product.new(name: 'No Quantity', description: 'No quantity item', image: 'No quantity image', price: 10, category_id: @category)
    end
    it 'is not valid if there is no category' do
      @category = Category.find_by(name: 'Apparel')
      @product = Product.new(name: 'No Category', description: 'No category item', image: 'No category image', price: 10, quantity: 10)
    end
  end
end
