class PurchasingManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_item, only: [:index, :create, :pay_item, :move_to_index]
  def index
    @user_furima = UserFurima.new
  end

  def create
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
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: furima_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if @item.user_id == current_user.id || @item.purchasing_management != nil
      return redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end


#tokenが送られていない
#必要なパラメータを受け取る addressテーブルに保存するデータを受け取る。item_idとuser_idも必要
#attr_accessorに必要な属性を追加する
#フォームオブジェクト内のsaveメソッドを編集する