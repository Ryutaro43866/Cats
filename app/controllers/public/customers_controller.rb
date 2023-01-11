class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:edit, :update]
  before_action :guest_check, except: [:index]

  def index
    @customers = Customer.where.not(name: 'guestuser').where(is_deleted: false).page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @items = Item.where(customer_id: @customer).page(params[:page]).per(6)
  end

  def edit
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

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :status, :is_deleted)
  end

  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to items_path
    end
  end
end
