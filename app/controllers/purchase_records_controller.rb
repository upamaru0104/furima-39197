class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @purchase_info = PurchaseInfo.new(purchase_params)
    @shipping_info = ShippingInfo.new(address_params)
  
    if @purchase_info.valid? && @shipping_info.valid?
      @purchase_info.save
      @shipping_info.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def purchase_params
    params.require(:purchase_info).permit(:item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def address_params
    params.require(:shipping_info).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number)  end

end
