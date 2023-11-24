# Referência: https://medium.com/@dljerome/design-patterns-in-ruby-decorator-b7f2da4153b0

class Coffee
    attr_accessor :price
  
    def price
      10.0
    end
end
  

class CoffeeWithCream
    attr_accessor :price

    def initialize(coffee)
        @coffee = coffee
    end

    # additional behavior
    def price
        @coffee.price += 2.50
    end
end
  
class CoffeeWithSugar
    attr_accessor :price

    def initialize(coffee)
        @coffee = coffee
    end

    # additional behavior
    def price
        @coffee.price += 0.25
    end

    # additional operation
    # which we are then able to call on the
    # enclosed, decorated coffee object.
    def induce_sugar_rush
        # code to induce sugar rush goes here.
    end
end
  
# Exemplo de uso
coffee = Coffee.new
coffee = CoffeeWithCream.new(coffee)
coffee = CoffeeWithSugar.new(coffee)

puts coffee.price # 3.25

puts coffee.induce_sugar_rush # "sugar rush induced."