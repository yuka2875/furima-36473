class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_purchased, only: [:index, :create]



  def index
    # @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaserecordAddress.new

    unless @item.purchase_record.present? && @item.user == current_user
      redirect_to root_path
  end
end

  def create
    # @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaserecordAddress.new(purchase_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchaserecord_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :price).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_purchased
    unless @item.purchase_record.nil? 
      redirect_to root_path
   end
  end
end


