class Public::CustomersController < ApplicationController
  before_action :guest_check, only: [:show, :edit]

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @items = Item.where(customer_id: @customer).page(params[:page]).per(6)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      flash[:alert] = "保存できませんでした"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :status)
  end
end
