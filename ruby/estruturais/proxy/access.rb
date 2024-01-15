# Classe User para representar diferentes tipos de usuários
class User
    attr_reader :name, :role
  
    def initialize(name, role)
        @name = name
        @role = role
    end
end
  
# Subject: Interface para Access
class Access
    def request_access(user)
        raise NotImplementedError, "#{self.class} deve implementar este método."
    end
  end
  
# RealSubject: Implementação real de Access
class RealAccess < Access
    def request_access(user)
        puts "Acesso concedido para transações financeiras para o usuário #{user.name}."
    end
end
  
# Proxy: Proxy para controlar o acesso a RealAccess
class ProxyAccess < Access
    def initialize
        @real_access = RealAccess.new
    end
  
    def request_access(user)
        if user_has_permission?(user)
            @real_access.request_access(user)
        else
            puts "Acesso negado para transações financeiras para o usuário #{user.name}."
        end
    end
  
    private
  
    def user_has_permission?(user)
        user.role == "admin"
    end
end
  
# Exemplo de uso
  
# Criando instâncias de diferentes usuários
admin_user = User.new("Admin User", "admin")
guest_user = User.new("Guest User", "guest")
  
# Criando uma instância do ProxyAccess
proxy_access = ProxyAccess.new
  
# Chamando o método request_access para diferentes usuários
proxy_access.request_access(admin_user)
proxy_access.request_access(guest_user)
  