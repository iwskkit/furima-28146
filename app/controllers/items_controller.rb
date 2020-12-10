class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
      @item = Item.find(params[:id])
      @category = Category.find_by(id: @item.category_id)
      @fee_burden = FeeBurden.find_by(id: @item.fee_burden_id)
      @handling_time = HandlingTime.find_by(id: @item.handling_time_id)
      @prefecture = Prefecture.find_by(id: @item.prefecture_id)
      @status = Status.find_by(id: @item.status_id)
  end

  private
  def item_params
    params.require(:item).permit(:content, :image, :name, :detail, :price, :category_id, :status_id, :handling_time_id, :prefecture_id, :fee_burden_id).merge(user_id: current_user.id)
  end

end
