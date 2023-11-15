# Componente base (Component)
class FileSystem
  def display_structure(indent = 0)
    raise NotImplementedError, "Método 'display_structure' deve ser implementado na classe filha"
  end
end

# Folha (Leaf): Representa um arquivo
class Document < FileSystem
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def display_structure(indent = 0)
    puts "  " * indent + "\e[32m #{name}\e[0m"  # \e[32m é a cor verde, \e[0m é para redefinir para a cor padrão
  end
end

# Composto (Composite): Representa um diretório que pode conter arquivos e subdiretórios
class Folder < FileSystem
  attr_reader :name
  attr_reader :components

  def initialize(name)
    @name = name
    @components = []
  end

  def add_component(component)
    @components << component
  end

  def display_structure(indent = 0)
    puts "  " * indent + "\e[34m #{name}/\e[0m"  # \e[34m é a cor azul, \e[0m é para redefinir para a cor padrão
    @components.each { |component| component.display_structure(indent + 1) }
  end
end

# Exemplo de uso
document_1 = Document.new("arquivo1.txt")
document_2 = Document.new("arquivo2.txt")

folder_1 = Folder.new("Meus Documentos")
folder_1.add_component(document_1)
folder_1.add_component(document_2)

document_3 = Document.new("arquivo3.txt")
folder_2 = Folder.new("Meus Downloads")
folder_2.add_component(document_3)

folder_root = Folder.new("Raiz")
folder_root.add_component(folder_1)
folder_root.add_component(folder_2)

folder_root.display_structure

