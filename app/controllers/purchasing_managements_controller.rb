class PurchasingManagementsController < ApplicationController
  def index
    @user_furima = UserFurima.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_furima = UserFurima.new(furima_params)
      if @user_furima.valid?
        pay_item
        @user_furima.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private
  def furima_params
    params.require(:user_furima).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: furima_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end


#tokenが送られていない
#必要なパラメータを受け取る addressテーブルに保存するデータを受け取る。item_idとuser_idも必要
#attr_accessorに必要な属性を追加する
#フォームオブジェクト内のsaveメソッドを編集する