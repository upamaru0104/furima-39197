require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    describe '購入者情報の保存' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
        sleep(0.01)
      end
  
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@purchase_address).to be_valid
        end
        it '建物名は空でも保存できること' do
          @purchase_address.building_name = ''
          expect(@purchase_address).to be_valid
        end
      end
  
      context '内容に問題がある場合' do
        it '郵便番号が空だと保存できないこと' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号はハイフン(-)を含めて入力してください")
        end
        it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_address.postal_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("郵便番号はハイフン(-)を含めて入力してください")
        end
        it '都道府県を選択していないと保存できないこと' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
        end
        it '市町村が空だと保存できないこと' do
          @purchase_address.city = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("市町村を入力してください", "市町村はひらがな、カタカナ、漢字のみ入力してください")
        end
        it '番地が空だと保存できないこと' do
          @purchase_address.house_number = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
        end
        it '電話番号が空だと保存できないこと' do
          @purchase_address.telephone_number = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は10桁か11桁で入力してください")
        end
        it '電話番号が10桁未満だと保存できないこと' do
          @purchase_address.telephone_number = '080123456'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号は10桁か11桁で入力してください")
        end
        it '電話番号が12桁以上だと保存できないこと' do
          @purchase_address.telephone_number = '080123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号は10桁か11桁で入力してください")
        end
        it '電話番号が半角数値でないと保存できないこと' do
          @purchase_address.telephone_number = '０８０１２３４５６７８'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号は10桁か11桁で入力してください")
        end
        it '購入者情報が紐付いていないと保存できないこと' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
        end
        it '購入商品が紐付いていないと保存できないこと' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
        end
        it 'カード情報が空だと保存できないこと' do
          @purchase_address.token = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
        end
      end
    end
end
