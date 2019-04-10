require_relative '../src/receipt'
require_relative '../src/item_collection'
require_relative '../src/item'

RSpec.describe Receipt do

  it 'should print receipt in proper format' do
    items = [
        Item.new(200, 'perfume', 3, true),
        Item.new(100, 'shoes', 1, false)
    ]
    expect(Receipt.new(ItemCollection.new(items)).print).to eq("3 imported perfume: 690.0 \n1 shoes: 110.0 \nSales Tax: 100.0 \nTotal: 800.0")
  end

end