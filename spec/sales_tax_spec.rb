require_relative '../src/sales_tax'

RSpec.describe SalesTax do
  it 'should return 0 if empty' do
    expect(SalesTax.calculate_total_tax([])).to eq(0)
  end

  it 'should return 0 if good is in excluded category' do
    items = [
        Item.new(1, "books"),
        Item.new(1, "food"),
        Item.new(1, "medical_products")
    ]
    expect(SalesTax.calculate_total_tax(items)).to eq(0)
  end

  it 'should return the total tax for the items' do
    items = [
        Item.new(1, "book"),
        Item.new(1, "foods"),
        Item.new(1, "medical_product")
    ]
    expect(SalesTax.calculate_total_tax(items)).to eq(0.3)
  end

  it 'should apply 15% if is imported category' do
    items = [
        Item.new(1, "book", true),
    ]
    expect(SalesTax.calculate_total_tax(items)).to eq(0.15)
  end

  it 'should apply 5% tax if in excluded category but is imported' do
    items = [
        Item.new(1, "books", true),
    ]
    expect(SalesTax.calculate_total_tax(items)).to eq(0.05)
  end

  it 'should return 0 if nil value' do
    expect(SalesTax.calculate_total_tax(nil)).to eq(0)
  end

end