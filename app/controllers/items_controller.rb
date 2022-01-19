class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:destroy, :edit]




  def index
    @items = Item.all.order(created_at: :desc)
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
  end

  def update
    
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :explanation, :category_id, :item_status_id, :delivery_cost_id,
                                 :prefecture_id, :shipping_day_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_users
    unless @item.purchase_record.nil? && @item.user == current_user
    redirect_to action: :index 
  end
end
end