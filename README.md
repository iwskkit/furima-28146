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
| email | string | null: false |
| encrypted_password | string | null: false |
| birth    | date | null: false |

### Association

- has_many :items
- has_many :purchasing_managements
- 

## itemsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| detail | text | null: false |
| price  | integer| null: false |
| status_id | integer | null: false |
| fee_burden_id | integer | null: false|
| area_id | integer | null: false|
| handling_time_id | integer | null: false|
| category_id | integer | null: false|
| user | references | null: false, foreign_key: true|


### Association

- belongs_to :user
  has_one :purchasing_management


## addresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal_code| string| null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| house_number | string | null: false |
| building_name| string |
| phone_number | string | null: false |
| purchasing_management | references | null: false, foreign_key: true|

### Association
  belongs_to :purchasing_management

## purchasing_management テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_ket: true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :addresse