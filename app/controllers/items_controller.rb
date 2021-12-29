class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end
end

  private

def item_params
  params.require(:item).permit(:item_name, :image, :explanation, :category_id, :item_status_id, :delivery_cost_id,
                               :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end
