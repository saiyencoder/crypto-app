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
          flash.now[:notice] = "Invalid entry. Please try again"
        else
          @symbol = found_symbol.first
        end
      end
    end
  end

end
