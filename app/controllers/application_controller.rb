class ApplicationController < ActionController::Base
  BASE_URL = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
  COIN_KEY = ENV['CM_KEY']

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
