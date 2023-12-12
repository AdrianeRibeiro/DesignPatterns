# Subject: Interface para Image
class Image
    def display
      raise NotImplementedError, "#{self.class} deve implementar este método."
    end
end
  
# RealSubject: Implementação real de Image
class RealImage < Image
    def initialize(filename)
        @filename = filename
        load_image_from_disk
    end

    def display
        puts "Exibindo imagem #{@filename}_#{Time.now}"
    end

    private

    def load_image_from_disk
        puts "Carregando imagem #{@filename} do disco."
    end
end
  
# Proxy: Proxy para controlar o acesso a RealImage
class ProxyImage < Image
    def initialize(filename)
        @filename = filename
        @real_image = nil
    end

    def display
        @real_image = RealImage.new(@filename) if @real_image.nil?

        @real_image.display
    end
end
  
# Exemplo de uso
# Criando uma instância do ProxyImage (sem carregar a imagem ainda)
image_proxy = ProxyImage.new("exemplo.jpg")
  
# Chamando o método display. Neste ponto, a imagem será carregada do disco apenas se necessário.
image_proxy.display
  
# Chamando novamente. Agora a imagem não será recarregada, pois o Proxy já possui uma instância de RealImage.
image_proxy.display
  