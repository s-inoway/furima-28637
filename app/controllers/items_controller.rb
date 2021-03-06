class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_purchases, only: [:index, :show, :edit]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    redirect_to root_path if !(current_user.id == @item.user_id) || @purchases.include?(@item.id)
  end

  def update
    if (current_user.id == @item.user_id) && @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to item_path if !(current_user.id == @item.user_id)
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchases
    @purchases = Purchase.includes(:item).pluck(:item_id)
  end

  def item_params
    params.require(:item).permit(
      :image, :name, :comment, :category_id, :condition_id, :carriage_id, :pref_id, :ship_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
