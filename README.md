# テーブル設計

## users テーブル

| Column       | Type    | Options                         | 
| ------------ | ------- | ------------------------------- | 
| nickname     | string  | null: false                     | 
| email        | string  | null: false, unique: true       |
| password     | string  | null: false                     | 
| name         | string  | null: false                     | 
| name_reading | string  | null: false                     | 
| birthday     | integer | null: false                     | 

### Association
has_many :items
has_many :purchase_records

## items テーブル

| Column            | Type       | Options     | 
| ----------------- | ---------- | ----------- | 
| item_name         | string     | null: false | 
| item_explanation  | text       | null: false | 
| Item_detail       | string     | null: false | 
| item_delivery     | string     | null: false | 
| item_price        | string     | null: false | 
| item_seller(user) | references | null: false | 

### Association
belongs to :users
has_one    :purchase_records

## purchase_records テーブル

| Column           | Type       | Options     | 
| ---------------- | ---------- | ----------- | 
| buyer(user)      | references | null: false | 
| buyer_item(item) | references | null: false | 

### Association
belongs to :users
belongs to :items
has_one    :shipping_address

## shipping_address テーブル

| Column                        | Type    | Options     | 
| ----------------------------- | ------- | ----------- | 
| postal_code 郵便番号          | string  | null: false | 
| prefecture 都道府県           | integer | null: false | 
| city 市町村                   | string  | null: false | 
| house_number 番地             | string  | null: false | 
| buliding_name 建物名          | string  |             | 
| telephone_number 電話番号     | string  | null: false | 

### Association
belongs to :purchase_records
