class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
  end
  
  def create
    Order.create(user: current_user, item: @item)
    redirect_to root_path
  end 

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end
end
