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
| name_sei | string | null: false |
| name_mei | string | null: false |
| name_sei_kana| string | null: false |
| name_mei_kana | string | null: false |
| mailadress| string | null: false |
| encrypted_password | string | null: false |
| birth    | date | null: false |

### Association

- has_many :items
- has_one :purchasing_management
- 

## itemsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| detail | text | null: false |
| price  | integer| null: false |
| status | string | null: false |
| fee_burden | boolean | null: false|
| area | integer | null: false|
| handling_time | integer | null: false|
| category | integer | null: false|


### Association

- belong_to :users
  has_one :purchasing_management


## adresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal_code| string| null: false |
| prefecture   | integer | null: false |
| municipality | string | null: false |
| house_number | string | null: false |
| buliding_name| string |
| phone_number | string | null: false |

### Association
  has_one :purchasing_management

## purchasing_management テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user_id | integer | null: false|
| item_id | integer | null: false|

### Association
  has_one :users
  has_one :items
  has_one :adresses