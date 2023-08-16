class Trader::MachinesController < ApplicationController
  before_action :authenticate_admin!

  def create
    @machine = Machine.new(machine_params)
    @machines = Machine.all
    @machine.save
    redirect_to request.referer
  end

  def index
    @machines = Machine.all
    @machine = Machine.new
  end

  def destroy
    @machines = Machine.all
    @machine = Machine.find(params[:id])
    @machine.destroy
    redirect_to request.referer
  end

  private

  def machine_params
    params.require(:machine).permit(:possible_machine)
  end

end
