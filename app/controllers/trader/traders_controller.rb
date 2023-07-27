class Trader::TradersController < ApplicationController
  
  before_action :is_matching_login_trader, only: [:edit, :update]

  def index
    @areas = Area.all
    @machines = Machine.all
    #全条件一致
    if params[:area_ids].present? && params[:machine_ids].present? && params[:start_time].present?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
       @traders = @traders.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))
   #2条件一致
    elsif params[:area_ids].present? && params[:machine_ids].present? && params[:start_time].blank?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))

    elsif params[:area_ids].present? && params[:machine_ids].blank? && params[:start_time].present?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))
       @traders = @traders.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))

    elsif params[:area_ids].blank? && params[:machine_ids].present? && params[:start_time].present?
       @traders = Trader.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))
       @traders = @traders.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))
    #1条件一致
    elsif params[:area_ids].present? && params[:machine_ids].blank? && params[:start_time].blank?
       @traders = Trader.joins(:areas).merge(Area.where(id: params[:area_ids].presence))

    elsif params[:area_ids].blank? && params[:machine_ids].present? && params[:start_time].blank?
       @traders = Trader.joins(:machines).merge(Machine.where(id: params[:machine_ids].presence))

    elsif params[:area_ids].blank? && params[:machine_ids].blank? && params[:start_time].present?
       @traders = Trader.joins(:schedules).merge(Schedule.where(start_time: (params[:start_time].to_datetime)..(params[:start_time].to_datetime.end_of_day)))
    #条件無し
    else
       @traders = Trader.all
    end

  end

  def show
    @trader = Trader.find(params[:id])
    #日程(start_time)を日付順に並び替え
    @schedules = @trader.schedules.where(start_time: Time.zone.now.beginning_of_day..).order(start_time: :asc)
    @posts = @trader.posts
  end

  def edit
    @trader = Trader.find(params[:id])
    @areas = Area.all
    @machines = Machine.all
  end

  def update
    @trader = Trader.find(params[:id])
    @trader.update(trader_params)
    redirect_to trader_path(@trader.id)
  end

  private

  def trader_params
    params.require(:trader).permit(:company_name, :company_name_kana, :post_code, :address, :telephone_number, :compatible_machine, :public_relations, :profile_image, :start_time, area_ids: [], machine_ids: [])
  end

  def is_matching_login_trader
    trader = Trader.find(params[:id])
    unless trader.id == current_trader.id
      redirect_to traders_path
    end
  end

end
