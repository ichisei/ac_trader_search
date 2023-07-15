class Trader::PostsController < ApplicationController

  def new
    @comment = Post.new
    @trader = Trader.find(params[:trader_id])

  end

  def create
    trader = Trader.find(params[:trader_id])
    post = Post.new(post_params)
    post.customer_id = current_customer.id
    post.trader_id = trader.id

    if post.save
      redirect_to trader_path(trader.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment, :rating)
  end

end
