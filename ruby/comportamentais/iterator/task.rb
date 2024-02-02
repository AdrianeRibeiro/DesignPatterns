class PrioridadeOrderIterator
  include Enumerable

  attr_accessor :reverse
  private :reverse

  attr_accessor :collection
  private :collection

  def initialize(collection:, order_by:, reverse: false)
    @collection = collection
    @order_by = order_by
    @reverse = reverse
  end

  def each(&block)
    sorted_collection = reverse ? @collection.sort { |a, b| b.send(@order_by) <=> a.send(@order_by) } : @collection.sort_by(&@order_by)
    sorted_collection.each(&block)
  end
end

class Task
  attr_reader :description, :status, :priority

  def initialize(description, priority)
    @description = description
    @status = false
    @priority = priority
  end

  def done
    @status = true
  end

  def to_s
    status_str = @status ? 'Concluída' : 'Pendente'
    "#{@description} - #{@priority} - #{status_str}"
  end
end

class TasksList
  attr_accessor :collection
  private :collection

  def initialize(collection = [])
    @collection = collection
  end

  def iterator(order_by = nil)
    PrioridadeOrderIterator.new(collection: @collection, order_by: order_by)
  end

  def reverse_iterator(order_by = nil)
    PrioridadeOrderIterator.new(collection: @collection, order_by: order_by, reverse: true)
  end

  def add_task(description, priority)
    @collection << Task.new(description, priority)
  end
end

# Exemplo de uso
tasks_list = TasksList.new
tasks_list.add_task("Estudar Ruby", 3)
tasks_list.add_task("Concluir projeto", 1)
tasks_list.add_task("Fazer exercícios de programação", 2)

puts 'Ordenado por prioridade:'
tasks_list.iterator(:priority).each { |task| puts "#{task.to_s}" }
puts "\n"

puts 'Ordenado por prioridade (reverso):'
tasks_list.reverse_iterator(:priority).each { |task| puts "#{task.to_s}" }
puts "\n"

puts 'Ordenado por descrição:'
tasks_list.iterator(:description).each { |task| puts "#{task.to_s}" }
puts "\n"

puts 'Ordenado por descrição (reverso):'
tasks_list.reverse_iterator(:description).each { |task| puts "#{task.to_s}" }
puts "\n"