class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]


  def index
    @purchase_info = PurchaseAddress.new
    if @item.user != current_user
      if @item.purchase_record
        redirect_to root_path
      end
    else
      redirect_to root_path
    end

  end

  def new
  end

  def create
    @purchase_info = PurchaseAddress.new(purchase_params)
    if @purchase_info.valid?
      pay_item
      @purchase_info.save
      redirect_to root_path
    else
      render :index
    end
  end
      
  private
    
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(item_id:@item.id, user_id: current_user.id, token: params[:token])
  end
    
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
    
  def set_item
    @item = Item.find(params[:id])
  end
end

