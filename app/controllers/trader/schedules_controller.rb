class Trader::SchedulesController < ApplicationController
  before_action :authenticate_trader!

  def create
    #日程(start_time)未入力に対するif文
    if params[:start_time].present?
      @schedule = Schedule.new(start_time: params[:start_time], trader_id: current_trader.id)
    if !Schedule.where(:start_time => @schedule.start_time.to_date.beginning_of_day..@schedule.start_time.to_date.end_of_day,:trader_id => current_trader.id).exists?
      @schedule.save
    end
    end
    redirect_to request.referer
  end

  def index
    @schedules = current_trader.schedules
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to request.referer
  end


private

  def schedule_params
    params.require(:schedule).permit(:trader_id, :start_time)
  end

end