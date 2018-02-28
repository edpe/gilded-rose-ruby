require 'basic_item'

describe 'basic item' do
  context 'inherit attributes from item class' do
    it 'initialises with name, sell_in and quality attributes' do
      item = BasicItem.new('foo', 0, 0)
      expect(item).to respond_to(:name)
      expect(item).to respond_to(:quality)
      expect(item).to respond_to(:sell_in)
    end

    it 'outputs attributes as a string when item method to_s called' do
      item = BasicItem.new('foo', 1, 5)
      expect(item.to_s).to eq 'foo, 1, 5'
    end
  end

  context '#update_item' do
    it 'cannot have a negative quality value' do
      item = BasicItem.new('foo', 0, 0)
      item.update_item
      expect(item.quality).to eq 0
    end

    it 'reduces sell by date by one after one day' do
      item = BasicItem.new('foo', 1, 1)
      item.update_item
      expect(item.sell_in).to eq 0
    end

    it 'reduces in quality by one after one day' do
      item = BasicItem.new('foo', 1, 1)
      item.update_item
      expect(item.quality).to eq 0
    end

    it 'reduces in quality twice as fast after sell by date' do
      item = BasicItem.new('foo', 0, 3)
      item.update_item
      expect(item.quality).to eq 1
    end
  end
end
