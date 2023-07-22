class Trader::SchedulesController < ApplicationController

  def create
    @schedule = Schedule.new(start_time: params[:start_time], trader_id: current_trader.id)
    @schedule.save
    
    # if @schedule.save
    #   redirect_to request.referer
    # else
    #   render :index
    # end
  end

  def index
    @schedules = Schedule.all
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
