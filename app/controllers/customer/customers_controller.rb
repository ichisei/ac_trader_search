class Customer::CustomersController < ApplicationController
  
  def index
    @traders = Trader.all
  end

  def show
    @trader = Trader.find(params[:id])
    @post_comments = Post.all
  end
  
end
