require 'gilded_rose'
require 'item'

describe 'Gilded Rose' do

  describe 'legendary items' do
    it 'never has to be sold' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80 )]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].sell_in).to eq 0
    end

    it 'will not change in quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80 )]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 80
    end
  end

  describe 'aged brie' do
    it 'increases in quality the older it gets' do
      items = [Item.new('Aged Brie', 2, 0 )]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 1
    end

    it 'increases in quality twice as fast past sell by date' do
      items = [Item.new('Aged Brie', 0, 0 )]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 2
    end

    it 'cannot increase in quality beyond maximum quality' do
      items = [Item.new('Aged Brie', 2, 50 )]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 50
    end

    it 'changes sell by date by 1 after one day' do
      items = [Item.new('Aged Brie', 1, 20)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].sell_in).to eq 0
    end
  end

  describe 'backstage passes' do

    it 'increases in quality by the default amount when there are more than ten days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 1
    end

    it 'increases in quality by two when there are ten days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 2
    end

    it 'increases in quality by two when there are less than ten days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 2
    end

    it 'increases in quality by three when there are five days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 3
    end

    it 'increases in quality by three when there are less than five days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 3
    end

    it 'quality drops to 0 after the concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 0
    end

    it 'cannot increase in quality beyond maximum quality' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 50)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 50
    end

    it 'changes sell by date by 1 after one day' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 20)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].sell_in).to eq 0
    end
  end
end
