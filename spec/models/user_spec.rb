require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,name sei,name mei,name sei kana,name mei kana,email,password,birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが40文字以上であれば登録できない" do
        @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@がないと登録できない" do
        @user.email = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角数字のみでは登録できない" do
        @user.password = "20202020"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは半角英語のみでは登録できない" do
        @user.password = "aaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは全角では登録できない" do
        @user.password = "あああああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "name_seiが空だと登録できない" do
        @user.name_sei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei is invalid")
      end
      it "name_seiがアルファベットだと登録できない" do
        @user.name_sei = "A"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei is invalid")
      end
      it "name_meiが空だと登録できない" do
        @user.name_mei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei is invalid")
      end
      it "name_meiがアルファベットだと登録できない" do
        @user.name_mei = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei is invalid")
      end
      it "name_sei_kanaが空だと登録できない" do
        @user.name_sei_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei kana is invalid")
      end
      it "name_mei_kanaが空だと登録できない" do
        @user.name_mei_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei kana is invalid")
      end
      it "birthが空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end