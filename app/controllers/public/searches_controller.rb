class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "タイトル"
      customer = Customer.where(status: true)
      @items = Item.where(customer_id: customer).search(params[:word]).page(params[:page]).per(9)
    else
      @customers = Customer.where.not(name: 'guestuser').where(is_deleted: false).search(params[:word]).page(params[:page]).per(9)
    end
  end
end
