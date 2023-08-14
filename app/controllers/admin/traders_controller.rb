class Admin::TradersController < ApplicationController

  def index
    @traders = Trader.all.page(params[:page]).per(7)
  end

  def show
    @trader = Trader.find(params[:id])
    #日程(start_time)を日付順に並び替え
    @schedules = @trader.schedules.where(start_time: Time.zone.now.beginning_of_day..).order(start_time: :asc)
    @posts = @trader.posts
  end

end
