# Table design

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column    | Type       | Options                        |
| --------- | --------   | ------------------------------ |
| users_id  | references | null: false, foreign_key: true |
| image     | string     | null: false                    |
| name      | string     | null: false                    |
| comment   | string     | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| carriage  | string     | null: false                    |
| ship_from | string     | null: false                    |
| ship_date | string     | null: false                    |
| price     | integer    | null: false                    |

### Association

- belongs_to :users
- has_one :purchases

## purchases table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| users_id | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| purchases_id | references | null: false, foreign_key: true |
| zip_code     | integer    | null: false                    |
| pref         | string     | null: false                    |
| city         | string     | null: false                    |
| chome        | string     | null: false                    |
| bldg         | string     |                                |
| tel          | integer    | null: false                    |

### Association

- belongs_to :purchases
