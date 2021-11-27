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
|birth_month        |date   |null: false              |
|birth_year         |date   |null: false              |

### Association
- has_many :items
- has_many :purchaseRecords



## items テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|item_name          |string     |null: false                    |
|explanation        |text       |null: false                    |
|category           |text       |null: false                    |
|item_status        |string     |null: false                    |
|delivery_cost      |string     |null: false                    |
|shipping_area      |string     |null: false                    |
|shipping_days      |string     |null: false                    |
|price              |string     |null: false                    |
|user               |references |null: false ,foreign_key: true |  #出品者

### Association
- belongs_to :users
- has_one :purchaseRecords



## purchaseRecords テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |references |null: false ,foreign_key: true |  #購入者
|item               |references |null: false ,foreign_key: true |


### Association
- belongs_to :users
- has_one :items
- has_one :addresses



## addresses テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|postcode           |string     |null: false                    |
|prefecture_id      |string     |null: false                    |
|city               |string     |null: false                    |
|block              |string     |null: false                    |
|building           |string     |null: false                    |
|phone_number       |string     |null: false                    |
|user               |references |null: false ,foreign_key: true |


### Association
- has_one :purchaseRecords

