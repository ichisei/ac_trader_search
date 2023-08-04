class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(7)
  end

end
