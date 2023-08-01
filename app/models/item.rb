class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :delivery_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,message:"は300~9999999の範囲で入力してください"}
    validates :price, numericality: {only_integer: true, message: "は半角数値のみ入力してください"}
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  has_one    :purchase_record

end
