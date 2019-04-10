require_relative './excluded_category'

class Item
  attr_reader :quantity, :price, :category, :is_imported

  def initialize(price, category, quantity, is_imported = false)
    @price = price
    @category = category
    @quantity = quantity
    @is_imported = is_imported
  end

  def base_tax
    unless excluded
      return (@quantity * @price * 10) / 100.0
    end
    0.0
  end

  def import_tax
    if @is_imported
      return (@quantity * @price * 5) / 100.0
    end
    0.0
  end

  def value
    @quantity * @price + base_tax + import_tax
  end

  private

  def excluded
    ExcludedCategory.new.categories.include?(@category)
  end

end

