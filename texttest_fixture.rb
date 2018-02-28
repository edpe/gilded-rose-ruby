require './lib/gilded_rose'
require './lib/item'
require './lib/basic_item'
require './lib/legendary_item'
require './lib/aged_brie'
require './lib/backstage_pass'

items = [
  BasicItem.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
  AgedBrie.new(name = 'Aged Brie', sell_in = 2, quality = 0),
  BasicItem.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
  LegendaryItem.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
  LegendaryItem.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
  BackstagePass.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
  BackstagePass.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
  BackstagePass.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
  # This Conjured item does not work properly yet
  Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6), # <-- :O
]

days = 2
days = ARGV[0].to_i + 1 unless ARGV.empty?

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'
  items.each do |item|
    puts item
  end
  puts ''
  gilded_rose.update_quality
end
