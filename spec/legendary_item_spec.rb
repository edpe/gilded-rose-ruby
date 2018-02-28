require 'legendary_item'

context 'inherits attributes from item class' do
  it 'initialises with name, sell_in and quality attributes' do
    item = LegendaryItem.new('foo', 0, 0)
    expect(item).to respond_to(:name)
    expect(item).to respond_to(:quality)
    expect(item).to respond_to(:sell_in)
  end

  it 'outputs attributes as a string when item method to_s called' do
    item = LegendaryItem.new('foo', 1, 5)
    expect(item.to_s).to eq 'foo, 1, 5'
  end
end

describe 'legendary items' do
  it 'never have to be sold' do
    item = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80 )
    item.update_item
    expect(item.sell_in).to eq 0
  end

  it 'will not change in quality' do
    item = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80 )
    item.update_item
    expect(item.quality).to eq 80
  end
end
