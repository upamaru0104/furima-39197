class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含めて入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ入力してください"}
    validates :house_number
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "は10桁か11桁で入力してください"}
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      telephone_number: telephone_number,
      purchase_record_id: purchase_record.id)
  end
end