require_relative './excluded_category'

class Item
  attr_reader :price, :category, :quantity, :is_imported

  def initialize(price, category, quantity, is_imported = false)
    @price = price
    @category = category
    @quantity = quantity
    @is_imported = is_imported
  end

  def base_tax
    return (@quantity * @price * 10) / 100.0 unless excluded
    0.0
  end

  def import_tax
    return (@quantity * @price * 5) / 100.0 if @is_imported
    0.0
  end

  def value
    @quantity * @price + base_tax + import_tax
  end

  def description_text
    @quantity.to_s + imported_text + @category
  end

  private

  def imported_text
    return ' imported ' if @is_imported
    ' '
  end

  def excluded
    ExcludedCategory.new.categories.include?(@category)
  end

end

