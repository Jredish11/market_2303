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

    it "checks if a vendor sells a certain item" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      vendor1.stock(item1, 35) 
      vendor1.stock(item2, 7)
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)
      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)
      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item2)).to eq([vendor1])
      expect(market.vendors_that_sell(item3)).to eq([vendor2])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end

  describe "#sorted_item_list" do
    it "An array of the names of all items the Vendors have in stock, sorted alphabetically" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      vendor1.stock(item1, 35) 
      vendor1.stock(item2, 7)
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)
      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)
      expect(market.sorted_item_list).to eq(['Banana Nice Cream', 'Peach', "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe "#total_inventory" do
    it "Reports the quantities of all items sold at the market" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      vendor1.stock(item1, 35) 
      vendor3.stock(item1, 65)
      vendor1.stock(item2, 7)
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)
      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)
      expect(market.total_inventory).to eq({
                        @item1 => { 'Quantity' => 100,
                                    'Vendors' => [@vendor1, @vendor3] },
                        @item2 => { 'Quantity' => 7,
                                    'Vendors' => [@vendor1] },
                        @item3 => { 'Quantity' => 25,
                                    'Vendors' => [@vendor2] },
                        @item4 => { 'Quantity' => 50,
                                    'Vendors' => [@vendor2] },
                                    })
    end
  end
end




# Market #total_inventory
# Market #overstocked_item
# Use TDD to update your Market class to include the following methods:

# Method Name	Return Value
#total_inventory	Reports the quantities of all items sold at the market. Specifically, it should return a hash with items as keys and hashes as values - this sub-hash should have two key/value pairs: quantity pointing to total inventory for that item and vendors pointing to an array of the vendors that sell that item.
#overstocked_items	An array of Item objects that are overstocked. An item is overstocked if it is sold by more than 1 vendor AND the total quantity is greater than 50.