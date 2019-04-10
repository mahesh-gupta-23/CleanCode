require_relative '../src/item_collection'
require_relative '../src/item'

RSpec.describe ItemCollection do

  it 'should return 0 if nil' do
    expect(ItemCollection.new(nil).total_value).to eq(0)
  end

  it 'should return 0 if empty' do
    expect(ItemCollection.new([]).total_value).to eq(0)
  end

  it 'should total all the values and return' do
    items = [
        Item.new(200, "perfume", 3, true),
        Item.new(50, "slipper", 1, false),
        Item.new(150, "shoes", 1, false)
    ]
    collection = ItemCollection.new(items)
    expect(collection.total_value).to eq(910)
  end
  
end