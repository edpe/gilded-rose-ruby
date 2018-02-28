require 'item'

class BasicItem < Item

  def update_item
    decrement_sell_in
    unless @quality <= 0
      quality_multiplier = sell_in_passed ? 2 : 1
      quality_multiplier.times { decrement_quality }
    end
  end

private

  def decrement_sell_in
    @sell_in -= 1
  end

  def decrement_quality
    @quality -= 1
  end

  def sell_in_passed
    @sell_in < 0
  end

end
