class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    #@trader = Trader.find(params[:id])
    #レコードの開始時間が早い順にリスト取得※viewで日程順に表示
    @schedules = @trader.schedules.order(start_time: :asc)
    @posts = @trader.posts
  end

  private

  def trade_params
      params.require(:trader).permit(:start_time, area_ids: [], machine_ids: [])
  end

end
