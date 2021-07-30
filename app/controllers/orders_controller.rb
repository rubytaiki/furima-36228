class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_params, only: [:index, :create, :move_to_index]
  before_action :move_to_index, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city_word, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def move_to_index
     if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
