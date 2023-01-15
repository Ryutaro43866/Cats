class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "タイトル"
      is_deleted = Customer.where(is_deleted: false)
      status = Customer.where(status: true)
      @items = Item.where(customer_id: status, customer_id: is_deleted).search(params[:word]).page(params[:page]).per(9)
    else
      @customers = Customer.search(params[:word]).page(params[:page]).per(9).hide_guest
    end
  end
end
