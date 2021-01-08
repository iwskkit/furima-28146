class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :purchasing_management

  belongs_to_active_hash :user
  belongs_to_active_hash  :category
  belongs_to_active_hash  :fee_burden
  belongs_to_active_hash  :handling_time
  belongs_to_active_hash  :prefecture
  belongs_to_active_hash  :status

  has_one_attached :image

  suuzi = /\A[0-9]+\z/

  with_options presence: true do
    validates :name, length: { maximum:40 }
    validates :detail, length: { maximum:1000 }
    validates :price, format: { with: suuzi }, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
    validates :status_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :handling_time_id
    validates :category_id
    validates :image
    validates :user_id
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :handling_time_id
    validates :category_id
  end

  def was_attached?
    @item.image.attached?
  end

end
