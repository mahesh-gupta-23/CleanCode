require_relative '../src/item_collection'
require_relative '../src/item'

RSpec.describe ItemCollection do
  it 'should return 0 if empty' do
    collection = ItemCollection.new([])
    expect(collection.sales_tax).to eq(0)
  end

  it 'should return 0 if good is in excluded category' do
    items = [
        Item.new(1, 'books', 1),
        Item.new(1, 'food', 1),
        Item.new(1, 'medical_products', 1)
    ]
    collection = ItemCollection.new(items)
    expect(collection.sales_tax).to eq(0)
  end

  it 'should return the total tax for the items' do
    items = [
        Item.new(1, 'book', 1),
        Item.new(1, 'foods', 1),
        Item.new(1, 'medical_product', 1)
    ]
    collection = ItemCollection.new(items)
    expect(collection.sales_tax).to eq(0.3)
  end

  it 'should apply 15% if is imported category' do
    items = [
        Item.new(1, 'book', 1, true),
    ]
    collection = ItemCollection.new(items)
    expect(collection.sales_tax).to eq(0.15)
  end

  it 'should apply 5% tax if in excluded category but is imported' do
    items = [
        Item.new(1, 'books', 1, true),
    ]
    collection = ItemCollection.new(items)
    expect(collection.sales_tax).to eq(0.05)
  end

  it 'should return 0 if nil value' do
    expect(ItemCollection.new(nil).sales_tax).to eq(0)
  end

  it 'should return proper calculation including quantity' do
    items = [
        Item.new(1, 'perfume', 2, true),
    ]
    collection = ItemCollection.new(items)
    expect(collection.sales_tax).to eq(0.3)
  end
end