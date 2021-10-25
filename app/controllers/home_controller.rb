require 'websocket-client-simple'
class HomeController < ApplicationController
  def index
    #all_currencies =  Currency.get_currencies
    #ActionCable.server.broadcast('currency_channel', all_currencies)
  
  end

  # function for get all params from form
  def get_params
    @invest_bitcoin =params[:invest_bitcoin] 
    @invest_ethereum =params[:invest_ethereum] 
    @invest_cardano =params[:invest_cardano]
  end 

  def validate_params
    @is_valid_invest_bitcoin =  @invest_bitcoin.is_a? Numeric
    @is_valid_invest_ethereum =  @invest_ethereum.is_a? Numeric
    @is_valid_invest_cardano =  @invest_cardano.is_a? Numeric

    puts @is_valid_invest_bitcoin
  end

  def get_total
   @total_bitcoin =  Currency.calculate_value(@invest_bitcoin,"BTC")
   @total_ethereum =  Currency.calculate_value(@invest_ethereum,"ETH")
   @total_cardano  =  Currency.calculate_value(@invest_cardano,"ADA")
  end

  # Takes the current invest and calculate
  # Returns final calculations
  def calculate_invest
    get_params
    validate_params
    get_total
    #redirect_to '/'
    render :index
  end
end
