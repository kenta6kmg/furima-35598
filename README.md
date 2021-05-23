# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| ruby_last            | string  | null: false               |
| ruby_first           | string  | null: false               |
| birth                | date    | null: false               |

### Association

- has_many :items
- has_many :buys

## item テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| title               | string      | null: false                    |
| item_description    | text        | null: false                    |
| item_category_id    | integer     | null: false                    |
| item_condition_id   | integer     | null: false                    |
| shipping_charge_id  | integer     | null: false                    |
| shipping_charge_id    | integer     | null: false                    |
| day_id              | integer     | null: false                    |
| price               | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |
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
- belongs_to :user
- has_one    :shipping

## shippings テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| postal_code            | string       | null: false                    |
| prefecture_id          | integer      | null: false                    |
| street                 | string       | null: false                    |
| block                  | string       | null: false                    |
| building               | string       |                                |
| phone                  | string       | null: false                    |
| buy                    | references   | null: false, foreign_key: true |

### Association

- belongs_to :buy