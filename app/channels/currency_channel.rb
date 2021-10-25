 class CurrencyChannel < ApplicationCable::Channel
  def subscribed
    stream_for "currency_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
 
end
