class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :comment, :category_id, :condition_id, :carriage_id, :pref_id, :ship_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
