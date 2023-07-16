class Customer::CustomersController < ApplicationController

  def index
    @areas = Area.all
    @machines = Machine.all

    if params[:area_ids] && params[:machine_ids]
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
    elsif params[:area_ids]
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
    elsif params[:machine_ids]
       @traders = Traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
    else
       @traders = Trader.all
    end
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
