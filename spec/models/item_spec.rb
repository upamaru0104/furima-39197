require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      
      it '商品の画像、商品名、商品の説明、商品のカテゴリー、商品の状態、配送料の負担、発送までの日数、商品の価格、発送元の地、発送元の地域が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do

      it '商品名が空では登録できない' do
        @item.name = ''
	      @item.valid?
	      expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = ''
	      @item.valid?
	      expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it '商品のカテゴリーが空では登録できない' do
        @item.category_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "商品のカテゴリーを入力してください"
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_charge_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      it '発送までの日数が空では登録できない' do
        @item.delivery_day_id = 1
	      @item.valid?
	      expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end
      it '商品の価格が空では登録できない' do
        @item.price = ''
	      @item.valid?
	      expect(@item.errors.full_messages).to include "商品の価格を入力してください"
      end
      it '価格は、¥300~¥9,999,999の間でないと保存できない'do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include "商品の価格は300~9999999の範囲で半角数値で入力してください"
      end
      it '価格は、半角数値でないと保存できない'do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "商品の価格は300~9999999の範囲で半角数値で入力してください"
      end
      it '発送元の地域が空では登録できない'do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "発送元の地域を入力してください"
    end
      it '価格は、9999999円を超えると保存できない'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "商品の価格は300~9999999の範囲で半角数値で入力してください"
      end
      it '出品者情報が紐付いていなければ出品できない'do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "出品者情報を入力してください"
      end
      it '商品の画像が空では登録できない' do
        @item.images = nil
	      @item.valid?
	      expect(@item.errors.full_messages).to include "商品の画像を入力してください", "商品の画像は1枚以上5枚以下にしてください"
      end
    end
  end
end
