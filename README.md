# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| name_kana| string | null: false |
| mailadress| string | null: false |
| password | string | null: false |
| password_check| string | null: false |
| birth    | string | null: false |

### Association

- has_many :items
- has_one :adresses
- has_one :credit_cards

## itemsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| image  | text | null: false |
| detail | text | null: false |
| price  | integer| null: false |

### Association

- belongs_to :users
- has_one :adresses
- has_one :credit_cards

## adresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal_code| integer| null: false |
| prefecture   | string | null: false |
| municipality | string | null: false |
| house_number | integer | null: false |
| buliding_name| string | null: false |
| phone_number | integer| null: false |

### Association

- has_one :users
- has_many :credit_cards
  has_one :items

## credit_cards テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| credit_number | integer | null: false |
| expiration_year | integer | null: false |
| expiration | integer | null: false |
| security_code| integer | null: false |

### Association
  has_one :users
  has_one :items
  belongs_to :adresses