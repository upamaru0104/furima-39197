class PurchaseInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :shipping_address_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :shipping_address_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(id: shipping_address_id, purchase_record_id: purchase_record.id)
  end
end