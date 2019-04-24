class HomeController < ApplicationController
  
  def index
    response = HTTParty.get(
                             BASE_URL, 
                             query: 
                                    {
                                      "CMC_PRO_API_KEY": "#{COIN_KEY}"
                                    }
                            ).to_json
    @coins = JSON.parse(response)
    @data = @coins["data"]
    @my_coins = ["BTC","XRP","ADA","XLM", "STEEM"]
  end

  def about
  end

  def search
    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.upcase 
    end

    if @symbol == ""
      @symbol = "Please enter a currency to search"
    end
  end
end
