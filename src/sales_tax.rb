require_relative './item'

class SalesTax

  def self.calculate_total_tax(items)
    tax = 0.0
    return tax if items.nil?

    items.each do |item|
      tax += item.base_tax
      tax += item.import_tax
    end
    tax.round(2)
  end
end
