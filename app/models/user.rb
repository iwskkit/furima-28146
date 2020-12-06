class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  honmyou = /\A[ぁ-んァ-ン一-龥]/
  katakana = /\A[ァ-ヶー－]+\z/
  eisuuzi = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  with_options presence: true do
   validates :nickname, length: { maximum:40 }
   validates :name_sei, format: { with: honmyou }
   validates :name_mei, format: { with: honmyou }
   validates :name_sei_kana, format: { with: katakana }
   validates :name_mei_kana, format: { with: katakana }
   validates :password, format: { with: eisuuzi }
   validates :birth
  end
end
