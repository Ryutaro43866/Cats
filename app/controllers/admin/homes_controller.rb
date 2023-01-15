class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @customers = Customer.where.not(email: 'guest@example.com').page(params[:page]).per(10)
  end
end
