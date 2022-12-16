class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_check

  def index
    @favorites = Favorite.where(customer_id: current_customer.id).page(params[:page]).per(9)
  end

  def create
    @item = Item.find(params[:item_id])
    favorite = current_customer.favorites.new(item_id: @item.id)
    favorite.save
  end

  def destroy
    @item = Item.find(params[:item_id])
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.find_by(item_id: item.id)
    favorite.destroy
  end
end
