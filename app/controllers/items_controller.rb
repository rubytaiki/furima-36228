class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_params, only: [:edit, :update, :move_to_index]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :charge_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def find_params
    @item = Item.find(params[:id])
  end

end
