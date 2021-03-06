class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_item, only: [:edit, :update, :destroy]
  

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

    def show
    end

    def edit
      if @item.order != nil
        redirect_to root_path
     end
    end

    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end

    def destroy
          @item.destroy
          redirect_to root_path
    end



  private
  def item_params
    params.require(:item).permit(:title, :item_description, :item_category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id])
  end

  def redirect_item
    if current_user.id != @item.user_id
      redirect_to root_path
   end
  end
end
