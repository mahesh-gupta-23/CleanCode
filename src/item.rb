require_relative './excluded_category'

class Item
  attr_reader :category, :price, :is_imported

  def initialize(price, category, is_imported = false)
    @price = price
    @category = category
    @is_imported = is_imported
  end

  def base_tax
    unless excluded
      return (@price * 10) / 100.0
    end
    0.0
  end

  def import_tax
    if @is_imported
      return (@price * 5) / 100.0
    end
    0.0
  end

  def total_value
    price + base_tax + import_tax
  end

  private

  def excluded
    ExcludedCategory.new.categories.include?(@category)
  end

end

