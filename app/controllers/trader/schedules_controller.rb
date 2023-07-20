class Trader::SchedulesController < ApplicationController

  def create
    Schedule.new(start_time: params[:start_time], trader_id: current_trader.id).save
    redirect_to  edit_trader_path(current_trader.id)
  end

  def index
    @schedules = Schedule.all
  end


  def destroy
    @schedule = Schedule.find(params[:id])
    @Schedule.destroy
    redirect_to schedules_path, notice:"削除しました"

  end


private

  def schedule_params
    params.require(:schedule).permit(:trader_id, :start_time)
  end

end
