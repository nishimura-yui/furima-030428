class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
  end
  
  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end 

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end

  def order_params
    params.merge(user_id: current_user.id)
    params.merge(item_id: @item.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number).merge(order_id: @order.id)
  end
end
