class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :redirect_order


  def index
    @order_address = OrderAddress.new
    
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
       @order_address.save
       redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code, :city, :house_number, :building_name, :phone_number, :shipping_area_id ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
   end

  def redirect_order
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
   end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
         amount: @item[:price],  # 商品の値段
         card: order_params[:token],    # カードトークン
         currency: 'jpy'                # 通貨の種類（日本円）
      )
    end
  end
end

