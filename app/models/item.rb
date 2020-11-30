class Item < ApplicationRecord

  suuzi = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :detail
    validates :price, formet: { with: suuzi, message: "半角数字でないと登録できません" }, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
    validates :statu_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :handling_time_id
    validates :category_id
  end

end