class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:content, :image, :name, :detail, :price, :category_id, :status_id, :handling_time_id, :prefecture_id, :fee_burden_id).merge(user_id: current_user.id)
  end
end
