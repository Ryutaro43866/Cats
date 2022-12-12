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
    @items = Item.page(params[:page]).per(9)
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.customer_id = current_customer.id
    if @item.update(item_params)
      redirect_to item_path(@item.id), notice: '編集に成功しました'
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :introduction)
  end
end
