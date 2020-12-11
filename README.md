# Table design

## users table

| Column              | Type   | Options                   |
| ------------------  | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_furigana | string | null: false               |
| last_name_furigana  | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| name         | string     | null: false                    |
| comment      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| carriage_id  | integer    | null: false                    |
| ship_from_id | integer    | null: false                    |
| ship_date_id | integer    | null: false                    |
| price        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchases

## purchases table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| purchase | references | null: false, foreign_key: true |
| zip_code | integer    | null: false                    |
| pref     | string     | null: false                    |
| city     | string     | null: false                    |
| chome    | string     | null: false                    |
| bldg     | string     |                                |
| tel      | integer    | null: false                    |

### Association

- belongs_to :purchase
