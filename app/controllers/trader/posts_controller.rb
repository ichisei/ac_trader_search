class Trader::PostsController < ApplicationController
  
  def new
    @comment = Post.new
    @trader = Trader.find(params[:trader_id])

  end

  def create
    trader = Trader.find(params[trader:_id])
    comment = Post.new(post_params)
    comment.customer_id = current_customer.id
    comment.trader_id = trader.id
    comment.save
    redirect_to trader_path(trader)
  end

  private

  def post_params
    params.require(:post_comment).permit(:comment)
  end
  
end
