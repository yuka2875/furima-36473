# README
## users テーブル

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false ,unique: true|
|encrypted_password |string |null: false              |
|last_name          |string |null: false              |
|first_name         |string |null: false              |
|last_name_kana     |string |null: false              |
|first_name_kana    |string |null: false              |
|birth_date         |date   |null: false              |


### Association
- has_many :items
- has_many :purchase_records



## items テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|item_name          |string     |null: false                    |
|explanation        |text       |null: false                    |
|category_id        |integer    |null: false                    |
|item_status_id     |integer    |null: false                    |
|delivery_cost_id   |integer    |null: false                    |
|prefecture_id      |integer    |null: false                    |
|shipping_day_id    |integer    |null: false                    |
|price              |integer    |null: false                    |
|user               |references |null: false ,foreign_key: true |  #出品者

### Association
- belongs_to :user
- has_one :purchase_record



## purchase_records テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user_id            |references |null: false ,foreign_key: true |  #購入者
|item_id            |references |null: false ,foreign_key: true |


### Association
- belongs_to :user
- has_one :item
- has_one :addresse



## addresses テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|postcode           |string     |null: false                    |
|prefecture_id      |string     |null: false                    |
|city               |string     |null: false                    |
|block              |string     |null: false                    |
|building           |string     |                               |
|phone_number       |string     |null: false                    |


### Association
- belongs_to :purchase_record

