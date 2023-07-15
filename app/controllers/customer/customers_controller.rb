class Customer::CustomersController < ApplicationController

  def index
    #@traders = Customer.search
    #traders = Trader.where(area_id: 3)
    
    
    if params[:area]
      areaId = params[:area][:area_ids]
      @area = Area.find(areaId)
      @traders = @area.traders
    else
      @traders = Trader.all
    end

    @areas = Area.all
  end

  def show
    @trader = Trader.find(params[:id])
    @post_comments = Post.all
  end

  private

  def trade_params
      params.require(:trader).permit(area_ids: [])
  end

end
