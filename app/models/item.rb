class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :fee_burden
  belongs_to :handling_time
  belongs_to :prefecture_id
  belongs_to :statu

  has_one_attached :image

  suuzi = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :detail
    validates :price, formet: { with: suuzi, message: "半角数字でないと登録できません" }, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
    validates :statu_id, numericality: { other_than: 1 }
    validates :fee_burden_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :handling_time_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :content, presence: true, unless: :was_attached?
  end

  def was_attached?
    self.image.attached?
  end

end
