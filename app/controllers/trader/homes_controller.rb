class Trader::HomesController < ApplicationController

  def top
    #カスタマーがログインしている場合にのみ、カスタマーをログアウトさせる
    sign_out(current_customer) if customer_signed_in?
  end

end
