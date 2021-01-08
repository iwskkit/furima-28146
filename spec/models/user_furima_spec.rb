require 'rails_helper'
describe UserFurima do
  before do
    @user_furima = FactoryBot.build(:user_furima)
  end

  describe '購入' do
    context '購入がうまくいくとき' do
      it "postal_code,municipality,prefecture_id,house_number,phone_numbe,user_id,item_id,tokenが存在すれば登録できる" do
        expect(@user_furima).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @user_furima.postal_code = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが数字以外だと登録できない" do
        @user_furima.postal_code = "asd-asdf"
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeに-がないと登録できない" do
        @user_furima.postal_code = "1234567"
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Postal code is invalid")
      end
      it "municipalityが空だと登録できない" do
        @user_furima.municipality = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Municipality can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @user_furima.prefecture_id = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1だと登録できない" do
        @user_furima.prefecture_id = "1"
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "house_numberが空だと登録できない" do
        @user_furima.house_number = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @user_furima.phone_number = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが数字以外だと登録できない" do
        @user_furima.phone_number = "asdqwerr"
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが11文字以上だと登録できない" do
        @user_furima.phone_number = "123456789012"
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "user_idが空だと登録できない" do
        @user_furima.user_id = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @user_furima.item_id = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空だと登録できない" do
        @user_furima.token = ""
        @user_furima.valid?
        expect(@user_furima.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end