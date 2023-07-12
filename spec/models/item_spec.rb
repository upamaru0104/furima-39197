require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      
      it 'name、explanation、category_id、condition_id、delivery_charge_id、delivery_day_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do

      it 'nameが空では登録できない' do
        @item.name = ''
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
	      @item.valid?
	      expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
