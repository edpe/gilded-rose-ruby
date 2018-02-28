require 'aged_brie'

class BackstagePass < BasicItem

  def update_item
   unless @quality >=50 || @quality < 0
    increment_quality
    @quality = 0 if sell_in_passed
    end
    decrement_sell_in
  end

  def increment_quality
    @quality += 1 if @sell_in >= 11
    @quality += 2 if @sell_in <= 10 && @sell_in >= 6
    @quality += 3 if @sell_in <= 5
  end

end
