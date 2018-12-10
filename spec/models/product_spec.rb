require 'rails_helper'

RSpec.describe Product, type: :model do

  before:all do
    @category = Category.new(name: 'new category')
  end

  before:each do
    @product = @category.products.new(name: 'name', price: 1, quantity: 1)
  end

  describe 'Validations' do

    it 'is a valid product' do 
      expect(@product.errors.full_messages).to be_a Array
    end

    it 'is not valid without an name' do
      @product.name = nil
      expect(@product.errors.full_messages).to_not be `can't be blank`
    end
  end

  describe 'Validations' do
    it 'is not valid without a price' do
      @product.price = nil
      expect(@product.errors.full_messages).to_not be `can't be blank`
    end
  end

  describe 'Validations' do
    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product.errors.full_messages).to_not be `can't be blank`
    end
  end

  describe 'Validations' do
    it 'is not valid without a category' do
      @product.category = nil
      expect(@product.errors.full_messages).to_not be `can't be blank`
    end
  end
end
