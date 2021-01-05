class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  denwa = ^0\d{9,10}$

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: denwa }, length: { maximum:11 }
    validates :purchasing_management_id
  end
end
