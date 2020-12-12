class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end

  def update
     @item.update(item_params) if current_user.id == @item.user_id
      return redirect_to item_path if @item.valid?
      # 商品の更新ができなかった場合に
      render :edit
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    return redirect_to root_path if @item.valid?
     render :show
  end

  private
  def item_params
    params.require(:item).permit(:content, :image, :name, :detail, :price, :category_id, :status_id, :handling_time_id, :prefecture_id, :fee_burden_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
