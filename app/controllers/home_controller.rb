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

  private
  
  def api_data
    response = HTTParty.get(
                             BASE_URL, 
                             query: 
                                    {
                                      "CMC_PRO_API_KEY": "#{COIN_KEY}"
                                    }
                            ).to_json
    @coins = JSON.parse(response)
    @data = @coins["data"]
  end

end
