require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'


RSpec.describe Market do
  describe  Market do
    it "exists, has name, empty list of vendors" do
      market = Market.new("South Pearl Street Farmers Market")
      expect(market).to be_a(Market)
      expect(market.name).to eq("South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end

    it "adds vendors and their items to the vendors list" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")
      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)
      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end

    it "creates a list of vendors names" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")
      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

  end
end







# pry(main)> market.vendor_names
# #=> ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

# pry(main)> market.vendors_that_sell(item1)
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]

# pry(main)> market.vendors_that_sell(item4)
# #=> [#<Vendor:0x00007fe1349bed40...>]

# pry(main)> vendor1.potential_revenue
# #=> 29.75

# pry(main)> vendor2.potential_revenue
# #=> 345.00

# pry(main)> vendor3.potential_revenue
# #=> 48.75  


# pry(main)> item1 = Item.new({name: 'Peach', price: "$0.75"})
# #=> #<Item:0x007f9c56740d48...>

# pry(main)> item2 = Item.new({name: 'Tomato', price: "$0.50"})
# #=> #<Item:0x007f9c565c0ce8...>

# pry(main)> item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
# #=> #<Item:0x007f9c562a5f18...>

# pry(main)> item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
# #=> #<Item:0x007f9c56343038...>

# pry(main)> vendor1.stock(item1, 35)    

# pry(main)> vendor1.stock(item2, 7)    

# pry(main)> vendor2 = Vendor.new("Ba-Nom-a-Nom")    
# #=> #<Vendor:0x00007fe1349bed40...>

# pry(main)> vendor2.stock(item4, 50)    

# pry(main)> vendor2.stock(item3, 25)

# pry(main)> vendor3 = Vendor.new("Palisade Peach Shack")    
# #=> #<Vendor:0x00007fe134910650...>

# pry(main)> vendor3.stock(item1, 65)  

# pry(main)> market.add_vendor(vendor1)    

# pry(main)> market.add_vendor(vendor2)    

# pry(main)> market.add_vendor(vendor3)
