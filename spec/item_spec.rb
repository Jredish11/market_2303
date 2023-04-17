require 'rspec'
require './lib/item'
require './lib/vendor'


RSpec.describe Item do
  describe "Item"
    it "exists, has attributes, and empty inventory" do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      expect(item1).to be_a(Item)
      expect(item2).to be_a(Item)
      expect(item1.name).to eq('Peach')
      expect(item2.name).to eq('Tomato')
      expect(item1.price).to eq(0.75)
      expect(item2.price).to eq(0.5)
    end
end





# vendor = Vendor.new("Rocky Mountain Fresh")
# #=> #<Vendor:0x00007f85683152f0...>

# vendor.name
# #=> "Rocky Mountain Fresh"

# vendor.inventory
# #=> {}

# vendor.check_stock(item1)
# #=> 0

# vendor.stock(item1, 30)

# vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}

# vendor.check_stock(item1)
# #=> 30

# vendor.stock(item1, 25)

# vendor.check_stock(item1)
# #=> 55

# vendor.stock(item2, 12)

# vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}