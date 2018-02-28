require 'aged_brie'

describe 'aged brie' do
  context 'inherit attributes from item class' do
    it 'initialises with name, sell_in and quality attributes' do
      item = AgedBrie.new('foo', 0, 0)
      expect(item).to respond_to(:name)
      expect(item).to respond_to(:quality)
      expect(item).to respond_to(:sell_in)
    end

    it 'outputs attributes as a string when item method to_s called' do
      item = AgedBrie.new('foo', 1, 5)
      expect(item.to_s).to eq 'foo, 1, 5'
    end
  end

  context '#update_item' do
    it 'increases in quality the older it gets' do
      item = AgedBrie.new('Aged Brie', 2, 0)
      item.update_item
      expect(item.quality).to eq 1
    end

    it 'increases in quality twice as fast past sell by date' do
      item = AgedBrie.new('Aged Brie', 0, 0)
      item.update_item
      expect(item.quality).to eq 2
    end

    it 'cannot increase in quality beyond maximum quality' do
      item = AgedBrie.new('Aged Brie', 2, 50)
      item.update_item
      expect(item.quality).to eq 50
    end

    it 'changes sell by date by 1 after one day' do
      item = AgedBrie.new('Aged Brie', 1, 20)
      item.update_item
      expect(item.sell_in).to eq 0
    end
  end
end
