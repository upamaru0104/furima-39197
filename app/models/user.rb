class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ入力してください"}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ入力してください"}
    # カタカナのみ許可する
    validates :first_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "カタカナのみ入力してください"}
    validates :last_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "カタカナのみ入力してください"}
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "は半角英字と数字を含めてください" }
    validates :nickname
    validates :birthday
  end


  has_many :items
  has_many :purchase_records
end
