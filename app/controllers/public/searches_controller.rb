class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "タイトル"
      @items = Item.search(params[:word]).page(params[:page]).per(9)
    else
      @customers = Customer.search(params[:word]).page(params[:page]).per(9)
    end
  end
end
