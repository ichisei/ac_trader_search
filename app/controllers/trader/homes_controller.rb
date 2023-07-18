class Trader::HomesController < ApplicationController

  def top
    sign_out(current_customer) if customer_signed_in?
  end

end
