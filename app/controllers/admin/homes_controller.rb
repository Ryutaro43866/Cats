class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @customers = Customer.where.not(name: 'guestuser').page(params[:page]).per(10)
  end
end
