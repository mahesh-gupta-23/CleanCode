require_relative './item'

class TotalValue
  def self.calculate_total_value(items)
    value = 0.0
    return value if items.nil?

    items.each do |item|
      value += item.total_value
    end
    value.round(2)
  end
end
