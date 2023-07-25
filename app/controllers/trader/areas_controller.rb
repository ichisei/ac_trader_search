class Trader::AreasController < ApplicationController

  def create
    @area = Area.new(area_params)
    @areas = Area.all
    @area.save
    redirect_to request.referer
  end

  def index
    @areas = Area.all
    @area = Area.new
  end

  def destroy
    @areas = Area.all
    @area = Area.find(params[:id])
    @area.destroy
    redirect_to request.referer
  end

  private

  def area_params
    params.require(:area).permit(:compatible_area)
  end

end