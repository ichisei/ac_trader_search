class Customer::CustomersController < ApplicationController

  def index
    @areas = Area.all
    @machines = Machine.all

    if params[:area_ids].present? && params[:machine_ids].present?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
    elsif params[:area_ids].present? && params[:machine_ids].blank?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
    elsif params[:machine_ids].present? && params[:area_ids].blank?
       @traders = Trader.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
    else
       @traders = Trader.all
    end

    # traders = Trader.joins(:schedules).merge(Schedule.where())
    Trader.joins(:schedules).where("schedules.start_time).uniq
  end

  def show
    @trader = Trader.find(params[:id])
    @posts = @trader.posts
  end

  private
  def trade_params
      params.require(:trader).permit(area_ids: [], machine_ids: [])
  end

end
