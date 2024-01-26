# Interface Command: Define uma interface para a execução de uma operação específica.
class Command
  def execute
    raise NotImplementedError, "#{self.class} não implementou o método 'execute'"
  end
end

# Comandos Concretos:  Implementa a interface Command e vincula uma ação específica a um receptor.
class AddCommand < Command
  def initialize(calculator, value)
    @calculator = calculator
    @value = value
  end

  def execute
    @calculator.add(@value)
  end
end

class SubtractCommand < Command
  def initialize(calculator, value)
    @calculator = calculator
    @value = value
  end

  def execute
    @calculator.subtract(@value)
  end
end

# Receptor (Receiver): Sabe como realizar a operação associada ao comando. Em outras palavras, é o objeto que realiza a ação.
class Calculator
  def initialize
    @result = 0
  end

  def add(value)
    @result += value
    puts "Resultado após adição: #{@result}"
  end

  def subtract(value)
    @result -= value
    puts "Resultado após subtração: #{@result}"
  end
end

# Invocador (Invoker): Solicita a execução de um comando. Ele não precisa saber o que o comando faz, apenas como executá-lo.
class User
  def initialize(calculator)
    @calculator = calculator
  end

  def perform_operation(command)
    command.execute
  end
end

# Cliente: Cria um objeto Command e o associa com um Receiver. Também pode associar diferentes comandos com invocadores.
calculator = Calculator.new
add_command = AddCommand.new(calculator, 5)
subtract_command = SubtractCommand.new(calculator, 3)

user = User.new(calculator)

user.perform_operation(add_command)
user.perform_operation(subtract_command)
