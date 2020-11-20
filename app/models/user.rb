class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  kanji = /\A[一-龥]+\z/

  validates :nickname, presence: true, length: { maximum:50 }
  validates :name_sei, presence: true, format: { with: kanji }
  validates :name_mei, presence: true, format: { with: kanji }
  validates :name_sei_kana, presence: true
  validates :name_mei_kana, presence: true
  validates :birth, presence: true
end
