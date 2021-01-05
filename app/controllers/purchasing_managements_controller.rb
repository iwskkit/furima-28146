class PurchasingManagementsController < ApplicationController
  def index
    @user_furima = UserFurima.new
  end

  def create
    @user_furima = UserFurima.new(furima_params)
      if @user_furima.valid?
        pay_item
        @user_furima.save
        redirect_to action: :index
      else
        render action: :new
      end
  end

  private
  def furima_params
    params.require(:user_furima).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
