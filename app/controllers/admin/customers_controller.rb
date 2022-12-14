class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      flash[:alert] = "保存できませんでした"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :status, :is_deleted)
  end
end
