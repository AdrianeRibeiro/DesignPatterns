# Exemplo adaptado de https://dev.to/higordiego/padrao-flyweight-2n69

class Coffee
	attr_accessor :flavor, :price

	def initialize(flavor, price)
		@flavor = flavor
		@price = price
	end

	def get_flavor
		flavor
	end
end

class CoffeeShop
	attr_accessor :coffees

	def initialize
		@coffees = []
	end

	def take_order(flavor, table)
		@coffees[table] = CoffeeFlavorFactory.get_coffee_flavor(flavor)
		puts "Coffee flavor of table #{table} is #{coffees[table].get_flavor}"
	end
end

class CoffeeFlavorFactory
  @@flavors = {}

  def self.get_coffee_flavor(flavor)
    unless @@flavors[flavor]
      @@flavors[flavor] = Coffee.new(flavor, rand(10))
    end

    @@flavors[flavor]
  end

  def self.total_coffee_flavors_made
    @@flavors.length
  end
end

coffee_shop = CoffeeShop.new

coffee_shop.take_order("Cappuccino", 1)
coffee_shop.take_order("Cappuccino", 2)
coffee_shop.take_order("Espresso", 3)
coffee_shop.take_order("Cappuccino", 4)
coffee_shop.take_order("Espresso", 5)

puts "Total Coffee Flavors Made: #{CoffeeFlavorFactory.total_coffee_flavors_made}"