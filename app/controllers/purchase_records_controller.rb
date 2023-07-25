class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
  end

  private

end
