require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  require 'rails_helper'

    describe '購入者情報の保存' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      end
  
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@purchase_address).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @purchase_address.building_name = ''
          expect(@purchase_address).to be_valid
        end
      end
  
      context '内容に問題がある場合' do
        it 'postal_codeが空だと保存できないこと' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_address.postal_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
        it 'prefectureを選択していないと保存できないこと' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
        end
        it 'telephone_numberが空だと保存できないこと' do
          @purchase_address.telephone_number = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone_number can't be blank")
        end
        it 'telephone_numberが10桁未満だと保存できないこと' do
          @purchase_address.telephone_number = '080123456'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone_number can't be blank")
        end
        it 'telephone_numberが12桁以上だと保存できないこと' do
          @purchase_address.telephone_number = '080123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone_number can't be blank")
        end
        it 'telephone_numberが半角数値でないと保存できないこと' do
          @purchase_address.telephone_number = '０８０１２３４５６７８'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone_number can't be blank")
        end
        it 'userが紐付いていないと保存できないこと' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end
        it 'userが紐付いていないと保存できないこと' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end