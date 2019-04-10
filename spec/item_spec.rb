require_relative '../src/item'

RSpec.describe Item do

  it 'should add "imported" to description text if item is imported' do
    item = Item.new(200, "perfume", 3, true)
    expect(item.description_text).to eq("3 imported perfume")
  end

end