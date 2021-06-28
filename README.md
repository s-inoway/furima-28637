# READ ME

## 概要
プログラミングスクールで学習した、最終課題です。
フリマアプリのクローンサイトを作成しました。
- ユーザー登録機能や、商品の出品機能を持っています。
- 自身で出品した商品は、内容の編集や、出品の削除が可能です。
- 他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。
- Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。

## 接続先の情報
- https://furima-28637.herokuapp.com/
  - Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。
- ID/Pass
  - ID: kitchey.
  - Pass: 40081134
- テスト用アカウント等
  - 購入者用
    - メールアドレス: s.inoway.0804.kitchey@gmail.com
    - パスワード: 4008113g
  - 購入用カード情報
    - 番号：4242424242424242
    - 期限：24年3月
    - セキュリティコード：123
  - 出品者用
    - メールアドレス名: a@a
    - パスワード: aaaaa1



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
| pref_id      | integer    | null: false                    |
| ship_date_id | integer    | null: false                    |
| price        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

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
| zip_code | string     | null: false                    |
| pref_id  | integer    | null: false                    |
| city     | string     | null: false                    |
| chome    | string     | null: false                    |
| bldg     | string     |                                |
| tel      | string     | null: false                    |

### Association

- belongs_to :purchase
