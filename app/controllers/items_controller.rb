class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit]
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
    item = Item.find(params[:id])
    if current_user.id == item.user_id
     item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  private
  def item_params
    params.require(:item).permit(:content, :image, :name, :detail, :price, :category_id, :status_id, :handling_time_id, :prefecture_id, :fee_burden_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
