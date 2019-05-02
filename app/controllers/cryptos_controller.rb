class CryptosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crypto, :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :api_data, only: [:index, :show]

  def index
    @cryptos = Crypto.all
    @total = 0
  end
  
  def show
    show_page_variables
  end

  def new
    @crypto = Crypto.new
  end

  def create
    @crypto = Crypto.new(crypto_params)
    
    if @crypto.save
      flash[:success] = "Crypto was successfully created"
      redirect_to @crypto
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @crypto.update(crypto_params)
      flash[:success] = "Crypto was successfully updated"
      redirect_to @crypto
    else
      render 'edit'
    end  
  end

  def destroy
    @crypto.destroy
    flash[:danger] = "Crypto has been deleted"
    redirect_to cryptos_path
  end

  private

  def set_crypto
    @crypto = Crypto.find(params[:id])
  end

  def crypto_params
    params.require(:crypto).permit(:symbol, :user_id, :cost_per, :amount_owned)
  end

  def correct_user
    @c_user = current_user.cryptos.find_by(id: params[:id])
    redirect_to cryptos_path, notice: "Not Authorized to Access Page" if @c_user.nil?
  end 

  def show_page_variables
    @coin_in_hash = @data.select{|coin| coin["symbol"] == @crypto.symbol.upcase}
    @coin = @coin_in_hash.first
    @coin_change_1h = @coin["quote"]["USD"]["percent_change_1h"]
    @coin_change_24h = @coin["quote"]["USD"]["percent_change_24h"]
    @coin_change_7d = @coin["quote"]["USD"]["percent_change_7d"]
    @coin_symbol = @coin["symbol"]
    @coin_rank = @coin["cmc_rank"]
    @coin_price = @coin["quote"]["USD"]["price"].to_d
    @profit_loss = (@coin_price * @crypto.amount_owned) - (@crypto.cost_per * @crypto.amount_owned)
  end
end
