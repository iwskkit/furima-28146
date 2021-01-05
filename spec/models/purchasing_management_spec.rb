require 'rails_helper'
describe PurchasingManagement do
  before do
    @purchasing_management = FactoryBot.build(:purchasing_management)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "tokenが存在すれば登録できる" do
        expect(@purchasing_management).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空だと登録できない" do
        @purchasing_management.nickname = ""
        @purchasing_management.valid?
        expect(@purchasing_management.errors.full_messages).to include("Purchasing management can't be blank")
      end
    end
  end
end
end