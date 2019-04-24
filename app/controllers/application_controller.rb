class ApplicationController < ActionController::Base
  BASE_URL = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
  COIN_KEY = "CMC_PRO_API_KEY": "#{ENV['CM_KEY']}"
end
