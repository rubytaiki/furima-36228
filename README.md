## Users テーブル

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|first_name        |string |null: false              |
|last_name         |string |null: false              |
|first_name_kana   |string |null: false              |
|last_name_kana    |string |null: false              |
|birthday          |date   |null: false              |



### Association
has_many items
has_many orders


## Items テーブル

|Column                 |Type    |Options    |
|-----------------------|--------|-----------|
|item_name              |string  |null: false|
|description            |text    |null: false|
|category               |string  |null: false|
|status_id              |integer |null: false|
|charge_id              |integer |null: false|
|prefecture_id          |integer |null: false|
|shipping_date_id       |integer |null: false|
|price_id               |integer |null: false|



### Association
belongs_to user
has_one order


## Orders テーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|user   |references|null: false, foreign_key: true |
|item   |references|null: false, foreign_key: true |

### Association
belongs_to user
belongs_to item
has_one address


## Addresses テーブル

|Column           |Type       |Options                        | 
|-----------------|-----------|-------------------------------|
|postal_code      |integer    |null: false                    |
|prefecture_id    |integer    |null: false                    |
|city_word        |string     |null: false                    |
|house_number     |string     |null: false                    |
|building_name    |string     |                               |
|phone_number     |integer    |null: false                    |
|order            |references |null: false, foreign_key: true |

### Association
belongs_to order