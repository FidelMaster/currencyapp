require 'httparty'
require 'json'
class Currency < ApplicationRecord
   
      # Calculate future value in one year  
      # @param amount [String] the amount a user owns
     def self.calculate_value(amount,money_code)
       #future_capital = initial_capital(1+i)^n
       interest = get_interest(money_code)
       month_time = 12
       interest_percentege = interest.interest/100 
       sub_total = (1+interest_percentege)**month_time
       future_value =  amount.to_f*sub_total
       future_value.round(2)
     end

     def self.get_interest(code)
       interest_value = Currency.where(Symbol: code).take
     end
end
