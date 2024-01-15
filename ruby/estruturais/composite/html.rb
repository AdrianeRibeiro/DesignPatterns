# Componente (ou Interface) base para elementos HTML
class ElementHTML
    def render
        raise NotImplementedError, "O método 'render' deve ser implementado na classe filha."
    end
end
  
# Elemento HTML simples
class TextHTML < ElementHTML
    def initialize(text)
        @text = text
    end

    def render
        @text
    end
end
  
# Elemento HTML composto
class DivHTML < ElementHTML
    def initialize
        @elements = []
    end

    def add_element(element)
        @elements << element
    end

    def render
        content = @elements.map { |element| element.render }.join("\n")
        "<div>\n#{content}\n</div>"
    end
end
  
# Exemplo de uso
paragraph = TextHTML.new("Isso é um parágrafo simples.")
header = TextHTML.new("<h1>Isso é um cabeçalho</h1>")

div = DivHTML.new
div.add_element(paragraph)
div.add_element(header)

puts div.render