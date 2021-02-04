class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item
  def index
    purchases = Purchase.includes(:item).pluck(:item_id)
    if (current_user.id == @item.user_id) || purchases.include?(item.id)
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(
      :zip_code, :pref_id, :city, :chome, :bldg, :tel, :token
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(purchase_params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
