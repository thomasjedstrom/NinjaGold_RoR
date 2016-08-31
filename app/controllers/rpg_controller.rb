class RpgController < ApplicationController
  # @@timestamp = Time.now.strftime("%d")

  def index
    if !session[:log]
      session[:log] = ''
    end
    @log = session[:log]
    if !session[:gold]
      session[:gold] = 0
    end
    @gold = session[:gold]
  end

  def farm
    amount = 10 + Random.rand(10)
    session[:gold] += amount
    session[:log] += ('<p class="green">Earned ' + amount.to_s + ' gold from the farm (' + Time.now.strftime("%Y/%m/%d %I:%M %p") + ')</p>')
    redirect_to '/'
  end

  def cave
    amount = 5 + Random.rand(5)
    session[:gold] += amount
    session[:log] += ('<p class="green">Earned ' + amount.to_s + ' gold from the cave (' + Time.now.strftime("%Y/%m/%d %I:%M %p") + ')</p>')
    redirect_to '/'
  end

  def house
    amount = 2 + Random.rand(3)
    session[:gold] += amount
    session[:log] += ('<p class="green">Earned ' + amount.to_s + ' gold from the house (' + Time.now.strftime("%Y/%m/%d %I:%M %p") + ')</p>')
    redirect_to '/'
  end

  def casino
    amount = Random.rand(-50..50)
    session[:gold] += amount
    if amount > 0
      session[:log] += ('<p class="green">Entered a casino and won ' + amount.to_s + ' gold... YAY! (' + Time.now.strftime("%Y/%m/%d %I:%M %p") + ')</p>')
    else 
      session[:log] += ('<p class="red">Entered a casino and lost ' + amount.to_s + ' gold...  Ouch... (' + Time.now.strftime("%Y/%m/%d %I:%M %p") + ')</p>')
    end
    redirect_to '/'
  end

  def reset
    session[:gold] = 0
    session[:log] = ''
    redirect_to '/'
  end
end


# @d = Time.now.strftime("%b %d, %Y")
#     @t = Time.now.strftime("%H:%M %p")