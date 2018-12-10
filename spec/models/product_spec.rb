require 'rails_helper'

RSpec.describe Product, type: :model do

  before:all do
    @category = Category.new(name: 'new category')
  end

  before:each do
    @product = @category.products.new(name: 'name', price_cents: 1, quantity: 1)
  end

  describe 'Validations' do

    it 'is a valid product' do 
      expect(@product.errors.full_messages).to be_empty
    end

    it 'is not valid without an name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'is not valid without a category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
