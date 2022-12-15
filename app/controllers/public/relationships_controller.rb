class Public::RelationshipsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
  end

  def followings
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings.page(params[:page]).per(10)
  end

  def followers
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers.page(params[:page]).per(10)
  end
end
