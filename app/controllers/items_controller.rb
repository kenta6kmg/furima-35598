class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
  end
  #画像の保存を許可するストロングパラメーターにしましょう
end
