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
  end

  def about
  end
end
