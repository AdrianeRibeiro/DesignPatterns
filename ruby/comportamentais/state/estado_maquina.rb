# Interface Estado
class EstadoMaquina
  def inserir_moeda
    not_implemented_error
  end
  
  def ejetar_moeda
    not_implemented_error
  end
  
  def selecionar_item
    not_implemented_error
  end
  
  def dispensar_item
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, "#{self.class} não implementa o método '#{__method__}'"
  end
end

# Estados Concretos
class MaquinaPronta < EstadoMaquina
  def inserir_moeda
    puts "Moeda inserida."
  end
  
  def ejetar_moeda
    puts "Moeda ejetada."
  end
  
  def selecionar_item
    puts "Item selecionado."
    MaquinaSemEstoque.new
  end
  
  def dispensar_item
    puts "Por favor, selecione um item primeiro."
  end
end

class MaquinaSemEstoque < EstadoMaquina
  def inserir_moeda
    puts "Desculpe, máquina fora de estoque."
  end
  
  def ejetar_moeda
    puts "Moeda ejetada."
  end
  
  def selecionar_item
    puts "Desculpe, máquina fora de estoque."
  end
  
  def dispensar_item
    puts "Desculpe, máquina fora de estoque."
  end
end

# Contexto
class MaquinaVenda
  def initialize
    @estado_atual = MaquinaPronta.new
  end
  
  def set_estado(estado)
    @estado_atual = estado
  end
  
  def inserir_moeda
    @estado_atual.inserir_moeda
  end
  
  def ejetar_moeda
    @estado_atual.ejetar_moeda
  end
  
  def selecionar_item
    @estado_atual = @estado_atual.selecionar_item
  end
  
  def dispensar_item
    @estado_atual.dispensar_item
  end
end

# Exemplo de Uso
maquina = MaquinaVenda.new
maquina.inserir_moeda
maquina.selecionar_item
maquina.dispensar_item
maquina.inserir_moeda
maquina.selecionar_item
