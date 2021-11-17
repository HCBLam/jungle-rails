require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it 'is valid if all four fields are set' do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: 'Valid', description: 'Valid item', image: 'Valid image', price: 10, quantity: 10, category: @category)
      expect(@product).to be_valid
    end
    it 'is not valid if there is no name' do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: nil, description: 'No name item', image: 'No name image', price: 10, quantity: 10, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid if there is no price' do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: 'No Price', description: 'No price item', image: 'No description image', price: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid if there is no quantity' do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: 'No Quantity', description: 'No quantity item', image: 'No quantity image', price: 10, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid if there is no category' do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: 'No Category', description: 'No category item', image: 'No category image', price: 10, quantity: 10, category: nil)
      expect(@product).to_not be_valid
    end
  end
end
