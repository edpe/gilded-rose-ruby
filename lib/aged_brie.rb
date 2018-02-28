require 'basic_item'

class AgedBrie < BasicItem
  def update_item
    decrement_sell_in
    unless @quality < 0 || @quality >= 50
      quality_multiplier = sell_in_passed ? 2 : 1
      quality_multiplier.times { increment_quality }
    end
  end

  private

  def increment_quality
    @quality += 1
  end
end
