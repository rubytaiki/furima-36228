## Users テーブル

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false, unique: true|
|email             |string |null: false              |
|encrypted_password|string |null: false              |
|first_name        |string |null: false              |
|last_name         |string |null: false              |
|first_name_kana   |string |null: false              |
|last_name_kana    |string |null: false              |
|year              |string |null: false              |
|month             |string |null: false              |
|date              |string |null: false              |


### Association
has_many items
has_many orders


## Items テーブル

|Column              |Type    |Options    |
|--------------------|--------|-----------|
|item_name           |string  |null: false|
|description         |string  |null: false|
|category            |string  |null: false|
|status              |string  |null: false|
|charge              |string  |null: false|
|prefecture_shipping |string  |null: false|
|shipping_date       |string  |null: false|
|price               |string  |null: false|



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
|postal_code      |string     |null: false                    |
|prefecture       |string     |null: false                    |
|city_word        |string     |null: false                    |
|house_number     |string     |                               |
|building_name    |string     |null: false                    |
|phone_number     |string     |null: false                    |
|order            |references |null: false, foreign_key: true |

### Association
belongs_to order