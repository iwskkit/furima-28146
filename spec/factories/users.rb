FactoryBot.define do
  factory :user do
    nickname {Faker::Name.free_name(max_length: 40)}
    name_sei {Faker::Name.last_name}
    name_mei {Faker::Name.first_name}
    name_sei_kana {name_sei}
    name_mei_kana {name_mei}
    email {Faker::Internet.free_email}
    encrypted_password = Faker::Internet.password(min_length: 6)
    password {encrypted_password}
    password_confirmation {encrypted_password}
    birth {Faker::free_data}
  end
end