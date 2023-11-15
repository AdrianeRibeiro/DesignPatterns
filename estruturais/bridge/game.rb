# Neste exemplo, temos a abstração "Jogo" com as implementações "Xbox" e "PlayStation". 
# As implementações concretas, como "FIFA" e "CallOfDuty", usam uma plataforma específica para executar o jogo. 
# O padrão Bridge permite que as plataformas e os jogos variem independentemente, facilitando a expansão do sistema.

# Implementação: Plataforma
class Plataforma
    def executar_jogo
      raise NotImplementedError, "Método 'executar_jogo' deve ser implementado na classe filha"
    end
end
  
# Implementações concretas
class Xbox < Plataforma
    def executar_jogo
        puts "Executando jogo na Xbox"
    end
end
  
class PlayStation < Plataforma
    def executar_jogo
        puts "Executando jogo na PlayStation"
    end
end
  
# Abstração: Jogo
class Jogo
    attr_reader :plataforma

    def initialize(plataforma)
        @plataforma = plataforma
    end

    def jogar
        raise NotImplementedError, "Método 'jogar' deve ser implementado na classe filha"
    end
end
  
# Abstrações concretas
class FIFA < Jogo
    def jogar
        puts "Jogando FIFA"
        @plataforma.executar_jogo
    end
end
  
class CallOfDuty < Jogo
    def jogar
        puts "Jogando Call of Duty"
        @plataforma.executar_jogo
    end
end
  
# Exemplo de uso
xbox = Xbox.new
playstation = PlayStation.new

fifa_xbox = FIFA.new(xbox)
fifa_xbox.jogar

fifa_playstation = FIFA.new(playstation)
fifa_playstation.jogar

cod_xbox = CallOfDuty.new(xbox)
cod_xbox.jogar

cod_playstation = CallOfDuty.new(playstation)
cod_playstation.jogar

