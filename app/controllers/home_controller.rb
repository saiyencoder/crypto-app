class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:search]
  before_action :api_data, only: [:search]
  
  def index
    @name = current_user.email[/[^@]+/].capitalize if signed_in?
  end

  def about
  end

  def search
    @symbol = params[:sym]

    if @symbol
      @symbol.upcase!
      # If search is empty
      if @symbol == ""
        flash.now[:notice] = "Please enter a currency to search" if params[:searching]
      else
        found_symbol = @data.select{|key| key["symbol"] == @symbol}
        # If search is not a valid symbol
        if found_symbol.empty?
          @symbol = false
          flash.now[:notice] = "Invalid entry. Symbol was not found in the coin market."
        else
          @symbol = found_symbol.first
          search_variables(@symbol)
        end
      end
    end
  end

  private

  def search_variables(symbol)
    @coin_name = symbol["name"]
    @coin_change_1h = symbol["quote"]["USD"]["percent_change_1h"]
    @coin_change_24h = symbol["quote"]["USD"]["percent_change_24h"]
    @coin_change_7d = symbol["quote"]["USD"]["percent_change_7d"]
    @coin_symbol = symbol["symbol"]
    @coin_rank = symbol["cmc_rank"]
    @coin_price = symbol["quote"]["USD"]["price"].to_d
  end

end
