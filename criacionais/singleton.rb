module Singleton
  class Payment
    private_class_method :new
    attr_accessor :amount, :payment_method, :payment_date

    @instance = nil

    def self.instance
      @instance ||= new
    end

    def to_s
      "Payment of $#{@amount} made via #{@payment_method} on #{@payment_date}"
    end
  end

  class Client
    def execute
      payment = Payment.instance
      payment.amount = 100.00
      payment.payment_method = 'Credit Card'
      payment.payment_date = '2023-10-27'

      payment2 = Payment.instance
      payment2.to_s
    end
  end
end

module SingletonWithThread
  class Payment
    private_class_method :new
    attr_accessor :amount, :payment_method, :payment_date

    # garante que apenas uma thread por vez possa criar a instancia
    @mutex = Mutex.new

    def self.instance
      return @instance if @instance

      @mutex.synchronize do
        @instance ||= new
      end
    end

    def to_s
      "Payment of $#{@amount} made via #{@payment_method} on #{@payment_date}"
    end
  end

  class Client
    def execute
      threads = []
      # Varias threads tentam acessar a instancia unica de Payment simultaneamente

      5.times do
        threads << new_thread
      end

      threads.each(&:join)
    end

    def new_thread
      Thread.new do
        payment = Payment.instance
        payment.amount = rand(100..200)
        payment.payment_method = 'Credit Card'
        payment.payment_date = Time.now.strftime('%Y-%m-%d %H:%M:%S')
        puts payment.to_s
      end
    end
  end
end

# Exemplo de uso
puts "Singleton \n"
client = Singleton::Client.new
puts client.execute

puts "\nSingletonWithThread \n"
client = SingletonWithThread::Client.new
client.execute
