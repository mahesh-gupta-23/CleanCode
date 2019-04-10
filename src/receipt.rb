require_relative 'item_collection'

class Receipt
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print
    receipt_text = ''
    @items.items.each do |item|
      receipt_text += "#{description(item)} \n"
    end
    receipt_text += "#{sales_tax} \n"
    receipt_text += total

    receipt_text
  end

  private

  def description(item)
    "#{item.description_text}: #{item.value}"
  end

  def total
    "Total: #{@items.total_value}"
  end

  def sales_tax
    "Sales Tax: #{@items.sales_tax}"
  end

end