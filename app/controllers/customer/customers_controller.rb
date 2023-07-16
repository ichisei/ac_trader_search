class Customer::CustomersController < ApplicationController

  def index
    #@traders = Customer.search

    if params[:area]
      areaid = params[:area][:area_ids]
      @area = Area.find(areaid)
      @traders = @area.traders
    else
      @traders = Trader.all
    end
    
      @areas = Area.all

     if params[:machine]
       machineid = params[:machine][:machine_ids]
       @machine = Machine.find(machineid)
       @traders = @machine.traders
     else
       @traders = Trader.all
     end
    　  @machines = Machine.all

  end




  def show
    @trader = Trader.find(params[:id])
    @post_comments = @trader.posts
  end

  private

  def trade_params
      params.require(:trader).permit(area_ids: [], machine_ids: [])
  end

end
