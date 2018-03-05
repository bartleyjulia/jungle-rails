require 'rails_helper'

RSpec.describe Product, type: :model do

  before :example do
    @categoryX = Category.create(name: 'categoryX');
    @productY = @categoryX.products.create!(name: 'productY', price_cents: 100, quantity: 100)
  end



  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(@productY).to be_valid
    end

    it 'is not valid without a name' do
      @productY.name = nil
      expect(@productY).to_not be_valid
    end
    it 'is not valid without a price' do
      @productY.price_cents = nil
      expect(@productY).to_not be_valid
    end
    it 'is not valid without a quantity' do
      @productY.quantity = nil
      expect(@productY).to_not be_valid
    end
    it 'is not valid without a category' do
      @productY.category = nil
      expect(@productY).to_not be_valid
    end
  end

  after :example do
    @categoryX.products.destroy_all
    @productY.destroy!
  end

end


