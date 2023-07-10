class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
