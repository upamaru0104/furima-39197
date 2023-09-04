require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      
      it 'ニックネーム、メールアドレス、パスワード、名前、名前の読み、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  
    context '新規登録できないとき' do

      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワードは半角英字と数字を含めてください", "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'パスワードとパスワード確認用が不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "名前を入力してください", "名前はひらがな、カタカナ、漢字のみ入力してください"
      end
      it '苗字が空では登録できない' do
        @user.last_name = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "苗字を入力してください", "苗字はひらがな、カタカナ、漢字のみ入力してください"
      end
      it '名前の読みが空では登録できない' do
        @user.first_name_reading = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "名前の読みを入力してください", "名前の読みカタカナのみ入力してください"
      end
      it '苗字の読みが空では登録できない' do
        @user.last_name_reading = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "苗字の読みを入力してください", "苗字の読みカタカナのみ入力してください"
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'abc00'
        @user.password_confirmation = 'abc00'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      it 'パスワードが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字と数字を含めてください')
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前はひらがな、カタカナ、漢字のみ入力してください")
      end
      it '苗字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字はひらがな、カタカナ、漢字のみ入力してください")
      end
      it '名前の読みが全角（カタカナ）でないと登録できない' do
        @user.first_name_reading = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前の読みカタカナのみ入力してください')
      end
      it '苗字の読みが全角（カタカナ）でないと登録できない' do
        @user.last_name_reading = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字の読みカタカナのみ入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字と数字を含めてください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ＡＢＣＤＥＦ'
        @user.password_confirmation = 'ＡＢＣＤＥＦ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字と数字を含めてください')
      end
    end
  end
end
