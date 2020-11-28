FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    name_sei { "山田"}
    name_mei { "太郎" }
    name_sei_kana { "ヤマダ" }
    name_mei_kana { "タロウ" }
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    birth {Faker::Date.between_except(from: 40.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end