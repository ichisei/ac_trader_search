class Customer::CustomersController < ApplicationController

  def index
    @areas = Area.all
    @machines = Machine.all

    if params[:area_ids].present? && params[:machine_ids].present? && params[:start_time].present?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
       @traders = @traders.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))

    elsif params[:area_ids].present? && params[:machine_ids].present? && params[:start_time].blank?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))

    elsif params[:area_ids].present? && params[:machine_ids].blank? && params[:start_time].present?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))

    elsif params[:area_ids].blank? && params[:machine_ids].present? && params[:start_time].present?
       @traders = Trader.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
       @traders = @traders.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))

    elsif params[:area_ids].present? && params[:machine_ids].blank? && params[:start_time].blank?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))

    elsif params[:area_ids].blank? && params[:machine_ids].present? && params[:start_time].blank?
       @traders = Trader.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))

    elsif params[:area_ids].blank? && params[:machine_ids].blank? && params[:start_time].present?
       @traders = Trader.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))

    else
       @traders = Trader.all
    end

  end

  def show
    @trader = Trader.find(params[:id])
    @posts = @trader.posts
  end

  private

  def trade_params
      params.require(:trader).permit(:start_time, area_ids: [], machine_ids: [])
  end

end
