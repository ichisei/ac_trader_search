class Trader::TradersController < ApplicationController

  before_action :is_matching_login_trader, only: [:edit, :update]

  def index
    @areas = Area.all
    @machines = Machine.all
    @traders = Trader.all.page(params[:page]).per(7)
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

  def destroy
    @trader = Trader.find(params[:id])
    @trader.destroy
    redirect_to root_path, notice: "退会しました。"
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
