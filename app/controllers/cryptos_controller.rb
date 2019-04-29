class CryptosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crypto, only: [:show, :edit, :update]

  def index
    @cryptos = Crypto.all
  end
  
  def show
  end

  def new
    @crypto = Crypto.new
  end

  def create
    @crypto = Crypto.new(crypto_params)
    
    if @crypto.save
      flash[:success] = "Crypto was successfully created"
      redirect_to cryptos_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @crypto.update(crypto_params)
      flash[:success] = "Crypto was successfully updated"
      redirect_to cryptos_path
    else
      render 'edit'
    end  
  end

  def destroy
  end

  private

  def set_crypto
    @crypto = Crypto.find(params[:id])
  end

  def crypto_params
    params.require(:crypto).permit(:symbol, :user_id, :cost_per, :amount_owned)
  end
  
end