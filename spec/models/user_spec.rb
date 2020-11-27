require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、name_sei,name_mei,name_sei_kana,name_mei_kana,email、password,password_confirmation,birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが40文字以下で登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        expect(@user).to be_valid
      end
      it "name_seiが全角(漢字、カタカナ、ひらがな)であれば登録できる" do
        expect(@user).to be_valid
      end
      it "name_meiが全角(漢字、カタカナ、ひらがな)であれば登録できる" do
        expect(@user).to be_valid
      end
      it "name_sei_kanaが全角(カタカナ)であれば登録できる" do
        expect(@user).to be_valid
      end
      it "name_mei_kanaが全角(カタカナ)であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが40文字以上であれば登録できない" do
        @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@がないと登録できない" do
        @user.email = "aaaaaaaaa"
        user.valid?
        expect(user.errors.full_messages).to include("Email can't include @")
      end
      it "passwordが空では登録できない" do
        @user.encrypted_password = ""
        user.valid?
        expect(user.errors.full_messages).to include("password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "name_seiが空だと登録できない" do
        @user.name_sei = ""
        user.valid?
        expect(user.errors.full_messages).to include("Name_sei can't be blank")
      end
      it "name_seiがアルファベットだと登録できない" do
        @user.name_sei = "a"
        user.valid?
        expect(user.errors.full_messages).to include("Name_sei can't be alphabet")
      end
      it "name_meiが空だと登録できない" do
        @user.name_mei = ""
        user.valid?
        expect(user.errors.full_messages).to include("Name_mei can't be blank")
      end
      it "name_meiがアルファベットだと登録できない" do
        @user.name_mei = "a"
        user.valid?
        expect(user.errors.full_messages).to include("Name_mei can't be alphabet")
      end
      it "name_sei_kanaが空だと登録できない" do
        @user.name_sei_kana = ""
        user.valid?
        expect(user.errors.full_messages).to include("Name_sei_kana can't be blank")
      end
      it "name_sei_kanaがだと登録できない" do
        @user.name_sei = ""
        user.valid?
        expect(user.errors.full_messages).to include("Name_sei can't be blank")
      end
      it "name_mei_kanaが空だと登録できない" do
        @user.name_mei_kana = ""
        user.valid?
        expect(user.errors.full_messages).to include("Name_mei_kana can't be blank")
      end
      it "birthが空だと登録できない" do
        @user.birth = ""
        user.valid?
        expect(user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end