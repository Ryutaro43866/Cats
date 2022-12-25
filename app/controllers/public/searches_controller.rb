class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "タイトル"
      customers = Customer.where(is_deleted: false)
      customer = Customer.where(status: true)
      @items = Item.where(customer_id: customer).where(customer_id: customers).search(params[:word]).page(params[:page]).per(9)
    else
      @customers = Customer.where.not(name: 'guestuser').where(is_deleted: false).search(params[:word]).page(params[:page]).per(9)
    end
  end
end
