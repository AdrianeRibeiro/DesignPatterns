# Exemplo retirado de https://refactoring.guru/pt-br/design-patterns/chain-of-responsibility/ruby/example


# The Handler interface declares a method for building the chain of handlers.
# It also declares a method for executing a request.
class Handler
  def next_handler=(_handler)
    not_implemented_error
  end

  def handle(_request)
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# The default chaining behavior can be implemented inside a base handler class.
class AbstractHandler < Handler
  attr_reader :next_handler

  def next_handler=(handler)
    @next_handler = handler
  end

  def handle(request)
    return @next_handler.handle(request) if @next_handler

    nil
  end
end

# All Concrete Handlers either handle a request or pass it to the next handler in the chain.
class MonkeyHandler < AbstractHandler
  def handle(request)
    if request == 'Banana'
      "Monkey: I'll eat the #{request}"
    else
      super(request)
    end
  end
end

class SquirrelHandler < AbstractHandler
  def handle(request)
    if request == 'Nut'
      "Squirrel: I'll eat the #{request}"
    else
      super(request)
    end
  end
end

class DogHandler < AbstractHandler
  def handle(request)
    if request == 'MeatBall'
      "Dog: I'll eat the #{request}"
    else
      super(request)
    end
  end
end

# The client code is usually suited to work with a single handler. 
# In most cases, it is not even aware that the handler is part of a chain.
def client_code(handler)
  ['Nut', 'Banana', 'Cup of coffee'].each do |food|
    puts "\n------------------------------"
    puts "\nClient: Who wants a #{food}?"

    result = handler.handle(food)
    if result
      puts "  #{result}"
    else
      puts "  #{food} was left untouched."
    end
  end
end

monkey = MonkeyHandler.new
squirrel = SquirrelHandler.new
dog = DogHandler.new

monkey.next_handler = squirrel
squirrel.next_handler = dog

# The client should be able to send a request to any handler, not just the first one in the chain.

puts "\e[32m Chain: Monkey > Squirrel > Dog \e[0m"
client_code(monkey)
puts "\n\n"

puts "\e[33m Chain: Subchain: Squirrel > Dog \e[0m"
client_code(squirrel)
puts "\n\n"
