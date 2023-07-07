require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'nickname、email、password・password_confirmation、first_name・last_name、first_name_reading・last_name_reading、birthdayが存在すれば登録できる' do
      end

    end
  
    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
        
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        
      end
      it 'first_nameが空では登録できない' do
        
      end
      it 'last_nameが空では登録できない' do
        
      end
      it 'first_name_readingが空では登録できない' do
        
      end
      it 'last_name_readingが空では登録できない' do
        
      end
      it 'birthdayが空では登録できない' do
        
      end
      it '重複したemailが存在する場合は登録できない' do
        
      end
      it 'emailは@を含まないと登録できない' do
        
      end
      it 'passwordが5文字以下では登録できない' do
        
      end
      it 'passwordが129文字以上では登録できない' do
        
      end
      it 'passwordが数字だけでは登録できない' do
        
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        
      end
      it 'first_name_readingが全角（カタカナ）でないと登録できない' do
        
      end
      it 'last_name_readingが全角（カタカナ）でないと登録できない' do
        
      end
    end
  end
end
