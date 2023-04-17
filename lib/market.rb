class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    vendors.select { |vendor| vendor.inventory.include?(item) }
  end

  def sorted_item_list
    vendors.flat_map { |vendor| vendor.inventory.keys.map { |item| item.name } }.sort.uniq
  end

  def total_inventory
    outer = Hash.new(0)
    vendors.each do |vendor|
    items = vendor.inventory.keys.each { |item, amount| outer[item] = {"Quantity" => amount, "Vendors" => vendor} }  
    end
  end
end