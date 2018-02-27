require 'item'

describe Item do
  subject(:item) { described_class.new('item', 10, 5) }

  it 'is initialised with name, sell_in and quality attributes' do
    expect(item.name).to eq 'item'
    expect(item.sell_in).to eq 10
    expect(item.quality).to eq 5
  end

  describe '#to_s' do
    it 'outputs attributes as a string' do
      expect(item.to_s).to eq 'item, 10, 5'
    end
  end

end
