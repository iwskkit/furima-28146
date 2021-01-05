require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所登録' do
    context '住所登録がうまくいくとき' do
      it "postal_code,municipality,prefecture_id,house_number,phone_numberが存在すれば登録できる" do
        expect(@address).to be_valid
      end
    end

    context '住所登録がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @address.postal_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが数字以外だと登録できない"
        @address.postal_code = "asd-asdf"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is not a number")
      end
      it "postal_codeに-がないと登録できない"
        @address.postal_code = "1234567"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
      it "municipalityが空だと登録できない" do
        @address.municipality = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipality can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @address.prefecture_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1だと登録できない"
        @address.prefecture_id = "1"
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "house_numberが空だと登録できない" do
        @address.house_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが数字以外だと登録できない" do
        @address.phone_number = "asdqwerr"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが11文字以上だと登録できない" do
        @address.phone_number = "123456789012"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end