class Item < ApplicationRecord
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :delivery_day_id,    presence: true
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image
  # has_one    :purchase_record
end
