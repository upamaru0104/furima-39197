# テーブル設計

## users テーブル

| Column             | Type   | Options                         | 
| ------------------ | ------ | ------------------------------- | 
| nickname           | string | null: false                     | 
| email              | string | null: false, unique: true       |
| encrypted_password | string | null: false                     | 
| first_name         | string | null: false                     | 
| last_name          | string | null: false                     | 
| first_name_reading | string | null: false                     | 
| last_name_reading  | string | null: false                     | 
| birthday_year      | date   | null: false                     | 
| birthday_month     | date   | null: false                     | 
| birthday_day       | date   | null: false                     | 

### Association
has_many :items
has_many :purchase_records

## items テーブル

| Column            | Type       | Options                        | 
| ----------------- | ---------- | -------------------------------| 
| item_name         | string     | null: false                    | 
| item_explanation  | text       | null: false                    | 
| item_detail_id    | integer    | null: false                    | 
| item_delivery_id  | integer    | null: false                    | 
| item_price        | integer    | null: false                    | 
| user              | references | null: false, foreign_key: true | 

### Association
belongs_to :user
has_one    :purchase_record

## purchase_records テーブル

| Column           | Type       | Options                        | 
| ---------------- | ---------- | ------------------------------ | 
| user             | references | null: false, foreign_key: true | 
| item             | references | null: false, foreign_key: true | 

### Association
belongs_to :user
belongs_to :item
has_one    :shipping_address

## shipping_addresses テーブル

| Column                    | Type        | Options                        | 
| ------------------------- | ----------- | ------------------------------ | 
| postal_code 郵便番号      | string      | null: false                    | 
| prefecture_id 都道府県    | integer     | null: false                    | 
| city 市町村               | string      | null: false                    | 
| house_number 番地         | string      | null: false                    | 
| buliding_name 建物名      | string      |                                | 
| telephone_number 電話番号 | string      | null: false                    |
| purchase_record           | references  | null: false, foreign_key: true | 

### Association
belongs_to :purchase_record
