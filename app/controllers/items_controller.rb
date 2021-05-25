class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      if current_user.id == @item.user_id
        else 
         redirect_to root_path
        end

      unless user_signed_in?
        redirect_to action: :new
      end
    end

    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end
  

  private
  def item_params
    params.require(:item).permit(:title, :item_description, :item_category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  before_action :set_item, only: [:show, :edit, :update]
  def set_item
   @item = Item.find(params[:id])
  end
end
