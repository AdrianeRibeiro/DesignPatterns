class ChatMediator
  def send_message(sender, message)
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, "#{self.class} must implement send_message method"
  end
end
  
class ChatRoom < ChatMediator
  def initialize
    @users = []
  end

  def add_user(user)
    @users << user
  end

  def send_message(sender, message)
    puts "#{sender.name} send: #{message}"

    @users.each do |user|
      user.receive_message(message) unless user == sender
    end
  end
end
  
class User
  attr_reader :name, :mediator

  def initialize(name, mediator)
    @name = name
    @mediator = mediator
    mediator.add_user(self)
  end

  def send_message(message)
    @mediator.send_message(self, message)
  end

  def receive_message(message)
    puts "#{@name} received: #{message}"
  end
end
  
# Exemplo de uso
mediator = ChatRoom.new

user1 = User.new("Alice", mediator)
user2 = User.new("Bob", mediator)

user1.send_message("Hello, #{user2.name}!")
user2.send_message("Hi, #{user1.name}!")
  