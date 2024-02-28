# Exemplo adaptado de https://medium.com/@kroolar/design-patterns-in-ruby-observer-fb9aff359dbc

# Sujeito observado
# mantém uma lista de observadores e fornece métodos para adicionar, remover e notificar os observadores.
class User
  attr_reader :name, :plan

  def initialize(name:, plan:)
    @name = name
    @plan = plan
    @observers = []
  end
  
  def plan=(plan)
    @plan = plan
    notify_observers
  end
  
  def add_observer(observer)
    @observers << observer unless @observers.include?(observer)
  end
  
  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |observer| observer.call(self) }
  end
end

# Observador
# o método update é chamado sempre que o estado do sujeito observado (User) mudar.
class Team
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def update(user)
    puts "#{self.name} was notified by #{user.name}"
  end
end

# Exemplo de uso
john_doe = User.new(name: 'John Doe', plan: 'Standard')

finance = Team.new('Finance')
support = Team.new('Support')

john_doe.add_observer(proc { |user| finance.update(user) })
john_doe.add_observer(proc { |user| support.update(user) })

john_doe.plan = 'Premium'
