class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    binding.pry
    if item.valid?
      item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :comment, :category_id, :condition_id, :carriage_id, :pref_id, :ship_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
