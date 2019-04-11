require_relative 'item_collection'

class Receipt
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print
    receipt_text = ''
    @items.descriptions.each do |description|
      receipt_text += "#{description} \n"
    end
    receipt_text += "#{sales_tax} \n"
    receipt_text += total

    receipt_text
  end

  private

  def total
    "Total: #{@items.total_value}"
  end

  def sales_tax
    "Sales Tax: #{@items.sales_tax}"
  end

end