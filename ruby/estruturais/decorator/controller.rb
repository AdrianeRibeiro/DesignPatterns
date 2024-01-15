# Referência: https://dev.to/vladhilko/how-to-implement-decorator-pattern-in-ruby-on-rails-7ji
# Exemplo aplicado para ruby on rails, onde esse padrão pode ser usado para não deixar os models "fat"

class User
    attr_accessor :name, :surname, :country, :city, :street

    def initialize
        @name = "Harry"
        @surname = "Potter"
        @country = "Inglaterra"
        @city = "Little Whinging"
        @street = "Rua dos Alfeneiros"
    end
end

class UsersController
    def show
        user = get_user 
        full_name = "#{user.name} #{user.surname}"
        full_address = "#{user.country} #{user.city} #{user.street}"
      
        { name: full_name, address: full_address }
    end

    def show_with_decorator
        user = get_user 
        decorated_user = Decorators::User.new(user)

        { name: decorated_user.full_name, address: decorated_user.full_address }
    end

    def get_user
        User.new
    end
end

module Decorators
    class User
        attr_reader :user
  
        def initialize(user)
            @user = user
        end

        def full_name
            "#{user.name} #{user.surname}"
        end

        def full_address
            "#{user.country} #{user.city} #{user.street}"
        end
    end
end

# Exemplo de uso

controller = UsersController.new
puts controller.show

puts controller.show_with_decorator
