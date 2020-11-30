class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  honmyou = /\A[ぁ-んァ-ン一-龥]/
  katakana = /\A[ァ-ヶー－]+\z/
  eisuuzi = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  validates :nickname, presence: true, length: { maximum:40 }
  validates :name_sei, presence: true, format: { with: honmyou }
  validates :name_mei, presence: true, format: { with: honmyou }
  validates :name_sei_kana, presence: true, format: { with: katakana }
  validates :name_mei_kana, presence: true, format: { with: katakana }
  validates :password, presence: true, format: { with: eisuuzi }
  validates :birth, presence: true
  
end
