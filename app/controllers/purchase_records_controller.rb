class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaserecordAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaserecordAddress.new(purchase_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private


  def purchase_params
    params.require(:purchaserecord_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end



