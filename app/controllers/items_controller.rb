class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
			redirect_to action: :index
		else
			render :new
		end
  end

  def show
    # @purchase_record = @item.purchase_record
  end

  def edit
    if @item.user != current_user
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show, id: @item.id
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user == current_user
      item.destroy
    else
      render :index
    end
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
