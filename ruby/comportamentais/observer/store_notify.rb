# Subject (Observable)
class Inventory
  attr_reader :stock
  
  def initialize
    @observers = []
    @stock = {}
  end
  
  def add_observer(observer)
    @observers << observer
  end
  
  def remove_observer(observer)
    @observers.delete(observer)
  end
  
  def update_stock(item, quantity)
    @stock[item] = quantity
    notify_observers(item, quantity)
  end
  
  private
  
  def notify_observers(item, quantity)
    @observers.each { |observer| observer.update(item, quantity) }
  end
end
  
# Observers
class EmailNotification
  def update(item, quantity)
    puts "Enviando e-mail de notificação: Estoque de #{item} é #{quantity}"
  end
end

class SMSNotification
  def update(item, quantity)
    puts "Enviando SMS de notificação: Estoque de #{item} é #{quantity}"
  end
end

class PushNotification
  def update(item, quantity)
    puts "Enviando notificação push: Estoque de #{item} é #{quantity}"
  end
end
  
# Exemplo de uso
inventory = Inventory.new

email_notifier = EmailNotification.new
sms_notifier = SMSNotification.new
push_notifier = PushNotification.new

inventory.add_observer(email_notifier)
inventory.add_observer(sms_notifier)
inventory.add_observer(push_notifier)

inventory.update_stock("Camisa", 50)
  