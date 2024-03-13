# Exemplo retirado de https://dev.to/kroolar/ruby-design-patterns-state-261l

# States that orders in a restaurant go through: New, In Progress, Ready, Received

# New
# Actions: pay for the order, check order status

# In Progress
# Actions: check order status

# Ready
# Actions: check order status, take the order

# Received
# Actions: check order status, rate the order

class State
  def initialize(order)
    @order = order
  end

  def pay
    cannot_use_error
  end

  def next_state
    cannot_use_error
  end

  def take
    cannot_use_error
  end

  def rate(number)
    cannot_use_error
  end

  private

  def cannot_use_error
    raise 'You cannot use this method on this state'
  end
end

class NewState < State
  def pay
    puts 'Payment has been accepted'

    next_state
  end

  def next_state
    @order.state = InProgressState.new(@order)
  end
end

class InProgressState < State
  def next_state
    puts 'Order is ready to take'

    @order.state = ReadyState.new(@order)
  end
end

class ReadyState < State
  def take
    puts 'The order has been taken'

    next_state
  end

  def next_state
    @order.state = ReceivedState.new(@order)
  end
end

class ReceivedState < State
  def rate(number)
    puts "You rated the order to: #{number}"
  end
end

class Order
  attr_accessor :state

  def initialize
    @state = NewState.new(self)
  end

  def pay
    state.pay
  end

  def next_state
    state.next_state
  end

  def take
    state.take
  end

  def rate(number)
    state.rate(number)
  end

  def status
    state.class.name.gsub('State', '')
  end
end

# Exemplo de Uso
order = Order.new
puts order.status

# order.take

order.pay
puts order.status

order.next_state
puts order.status

order.take

# order.take 
order.rate(5)