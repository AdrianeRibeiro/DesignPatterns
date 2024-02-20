# Exemplo retirado de https://refactoring.guru/pt-br/design-patterns/memento/ruby/example

# The Originator holds some important state that may change over time. 
# It also defines a method for saving the state inside a memento 
# and another method for restoring the state from it.
class Originator
  attr_accessor :state
  private :state

  def initialize(state)
    @state = state

    puts "Originator: My initial state is: #{@state}"
  end

  def do_something
    puts 'Originator: I\'m doing something important.'
    @state = generate_random_string(30)
    puts "Originator: and my state has changed to: #{@state}"
  end

  def save
    ConcreteMemento.new(@state)
  end

  def restore(memento)
    @state = memento.state

    puts "Originator: My state has changed to: #{@state}"
  end

  private 

  def generate_random_string(length = 10)
    ascii_letters = [*'a'..'z', *'A'..'Z']
    (0...length).map { ascii_letters.sample }.join
  end
end

# The Memento interface provides a way to retrieve the memento's metadata, such
# as creation date or name. However, it doesn't expose the Originator's state.
class Memento
  def name
    not_implemented_error
  end

  def date
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteMemento < Memento
  attr_reader :state
  attr_reader :date

  def initialize(state)
    @state = state
    @date = Time.now.strftime('%F %T')
  end

  def name
    "#{@date} / (#{@state[0, 9]}...)"
  end
end

# The Caretaker doesn't depend on the Concrete Memento class. Therefore, it
# doesn't have access to the originator's state, stored inside the memento. It
# works with all mementos via the base Memento interface.
class Caretaker
  def initialize(originator)
    @mementos = []
    @originator = originator
  end

  def backup
    puts "\nCaretaker: Saving Originator's state..."
    @mementos << @originator.save
  end

  def undo
    return if @mementos.empty?

    memento = @mementos.pop
    puts "Caretaker: Restoring state to: #{memento.name}"

    begin
      @originator.restore(memento)
    rescue StandardError
      undo
    end
  end

  def show_history
    puts 'Caretaker: Here\'s the list of mementos:'

    @mementos.each { |memento| puts memento.name }
  end
end

originator = Originator.new('Super-duper-super-puper-super.')
caretaker = Caretaker.new(originator)

caretaker.backup
originator.do_something

caretaker.backup
originator.do_something

caretaker.backup
originator.do_something

puts "\n"
caretaker.show_history

puts "\nClient: Now, let's rollback!\n"
caretaker.undo

puts "\nClient: Once more!\n"
caretaker.undo