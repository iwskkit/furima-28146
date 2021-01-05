class PurchasingManagementsController < ApplicationController
  def index
    @user_furima = UserFurima.new
  end

  def create
    @user_furima = UserFurima.new(furima_params)
      if @user_furima.valid?
        @user_furima.save
        redirect_to action: :index
      else
        render action: :new
      end
  end

  private
  def furima_params
    params.require(:user_furima).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id)
  end
end
