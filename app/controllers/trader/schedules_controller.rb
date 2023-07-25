class Trader::SchedulesController < ApplicationController

  def create
    #日程(start_time)未入力に対するif文
    if params[:start_time].present?
      @schedule = Schedule.new(start_time: params[:start_time], trader_id: current_trader.id)
      @schedule.save
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
