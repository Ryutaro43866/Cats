class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_check, only: [:new, :edit]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    if @item.save
      redirect_to item_path(@item), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def index
    customers = Customer.where(is_deleted: false)
    customer = Customer.where(status: true)
    @items = Item.where(customer_id: customer).where(customer_id: customers).order(created_at: :desc).page(params[:page]).per(9)
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

  def destroy
    @item = Item.find(params[:id])
    @item.customer_id = current_customer.id
    @item.destroy
    redirect_to items_path, notice: '削除に成功しました'
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :introduction)
  end

end
