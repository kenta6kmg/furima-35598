# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------  |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |


### Association

- has_many :items
- has_many :buys

## item テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| item_description | text       | null: false                    |
| item_category    | string     | null: false                    |
| item_condition   | string     | null: false                    |
| shipping_charge  | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| days             | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association

- has_one    :buy
- belongs_to :user

## buys テーブル

| Column     | Type       | Options                        |
| --------   | ---------  | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------  | ----------- |
| shipping_address       | text       | null: false |

### Association

- belongs_to :buy