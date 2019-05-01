class HomeController < ApplicationController
  before_action :api_data, only: [:index, :search]
  
  def index
    @my_coins = ["BTC","XRP","ADA","XLM", "STEEM"]
  end

  def about
  end

  def search
    @symbol = params[:sym]

    if @symbol == ""
      # This helps the flash msg not to appear when search is empty
      flash.now[:notice] = "Please enter a currency to search" if params[:searching]
    end

    if @symbol
      @symbol = @symbol.upcase 
    end

  end

end
