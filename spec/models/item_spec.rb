require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品登録'
  context '商品出品登録できるとき' do
  it 'image, title, item_description, item_category_id, item_condition_id, shipping_charge_id, shipping_area_id,day_id, price' do
   expect(@item).to be_valid
  end
end
  context '商品出品登録できないとき' do
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
     end
    it 'titleが空では保存できない' do
     @item.title = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it 'imageが空では保存できない' do
      @item.image  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_descriptionが空では保存できない' do
      @item.item_description  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end
    it 'item_category_idがid1では保存できない' do
      @item.item_category_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end
    it 'item_condition_idがid1では保存できない' do
      @item.item_condition_id  = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("Item condition must be other than 1")
   end
    it 'shipping_charge_idがid1では保存できない' do
      @item.shipping_charge_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it 'shipping_area_idがid1では保存できない' do
      @item.shipping_area_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it 'day_idがid1では保存できない' do
      @item.day_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end
    it 'priceが空では保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角では保存できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it 'priceが300以下では保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it 'priceが9999999以上ではでは保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
      it '英数字混合では保存できない' do
        @item.price = 'a1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
