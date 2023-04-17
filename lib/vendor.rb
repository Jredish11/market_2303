class Vendor
  attr_reader :name, :inventory 
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if inventory.include?(item)
      inventory.values.join.to_i
    else
      0
    end
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    inventory.sum { |item, amount| item.price * amount }
  end
end