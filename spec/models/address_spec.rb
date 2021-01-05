require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所登録' do
    context '住所登録がうまくいくとき' do
      it "全てが存在すれば登録できる" do
        expect(@address).to be_valid
      end
    end

    context '住所登録がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @address.postal_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
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
      it "house_numberが空だと登録できない" do
        @address.house_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it "building_nameが空だと登録できない" do
        @address.building_name = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Building name can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end