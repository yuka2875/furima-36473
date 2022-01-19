class PurchaseRecordsController < ApplicationController
  

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaserecordAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
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

  def purchase_params
    params.require(:purchaserecord_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :price).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )

  end

  


end



