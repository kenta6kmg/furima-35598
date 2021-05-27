class OrdersController < ApplicationController

  def index
    @order = Order.new
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :city, :house_number, :building_name, :phone_number, :shipping_area_id ).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
