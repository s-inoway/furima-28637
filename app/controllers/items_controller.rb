class ItemsController < ApplicationController

  def index
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(
      :user_id, :name, :comment, :category_id, :condition_id, :carriage_id, :pref_id, :ship_date_id, :price
    )
  end
end
