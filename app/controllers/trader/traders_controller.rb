class Trader::TradersController < ApplicationController
  
  def show
    @trader = Trader.find(params[:id])
    
  end

  def edit
    @trader = Trader.find(params[:id])
    
  end

  def update
    @trader = Trader.find(params[:id])
    @trader.update(trader_params)
    redirect_to trader_path(@item.id)
  end
  
  private

  def trader_params
    params.require(:trader).permit(:company_name, :company_name_kana, :post_code, :address, :telephone_number, :is_compatible_machine, :public_relations, :profile_image)
  end
  
end