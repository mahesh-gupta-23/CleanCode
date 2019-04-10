require_relative './excluded_category'

class ItemCollection
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def sales_tax
    tax = 0.0
    return tax if @items.nil?

    @items.each do |current|
      tax += current.base_tax
      tax += current.import_tax
    end
    tax.round(2)
  end

  def total_value
    value = 0.0
    return value if @items.nil?

    @items.each do |current|
      value += current.value
    end
    value.round(2)
  end

end

