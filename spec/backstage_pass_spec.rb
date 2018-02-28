require 'backstage_pass'

describe 'backstage pass' do

  context 'inherit attributes from item class' do
    it 'initialises with name, sell_in and quality attributes' do
      item = BackstagePass.new('foo', 0, 0)
      expect(item).to respond_to(:name)
      expect(item).to respond_to(:quality)
      expect(item).to respond_to(:sell_in)
    end

    it 'outputs attributes as a string when item method to_s called' do
      item = BackstagePass.new('foo', 1, 5)
      expect(item.to_s).to eq 'foo, 1, 5'
    end
  end

  context '#update item' do
    it 'increases in quality by the default amount when there are more than ten days remaining' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 0)
      item.update_item
      expect(item.quality).to eq 1
    end

    it 'increases in quality by two when there are ten days remaining' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)
      item.update_item
      expect(item.quality).to eq 2
    end

    it 'increases in quality by two when there are less than ten days remaining' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 9, 0)
      item.update_item
      expect(item.quality).to eq 2
    end

    it 'increases in quality by three when there are five days remaining' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 0)
      item.update_item
      expect(item.quality).to eq 3
    end

    it 'increases in quality by three when there are less than five days remaining' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 4, 0)
      item.update_item
      expect(item.quality).to eq 3
    end

    it 'quality drops to 0 after the concert' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)
      item.update_item
      expect(item.quality).to eq 0
    end

    it 'cannot increase in quality beyond maximum quality' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 20, 50)
      item.update_item
      expect(item.quality).to eq 50
    end

    it 'changes sell by date by 1 after one day' do
      item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 1, 20)
      item.update_item
      expect(item.sell_in).to eq 0
    end
  end
end
