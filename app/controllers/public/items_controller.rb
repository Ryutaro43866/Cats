class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    if @item.save
      redirect_to items_path, notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @customer = Customer.find(@item.customer_id)
  end

  def edit

  end

  def update

  end

  private

  def item_params
    params.require(:item).permit(:item_image, :title, :introduction)
  end
end
