class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :delivery_day

  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image
  # has_one    :purchase_record
end
