# [Factory](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/factory.rb)


- Usado para criar objetos de forma flexível e desacoplada.
- Ajuda a promover o princípio do "Open/Closed" - o código deve estar aberto para extensão, mas fechado para modificação. 
- É útil em situações em que você não sabe exatamente qual classe de objeto deve ser instanciada até o tempo de execução.
- A ideia central do padrão Factory é definir uma interface (ou classe abstrata) que declara um método para a criação de objetos. 
  - As classes concretas que implementam essa interface fornecem a implementação real desse método, criando instâncias de objetos específicos. Isso permite que o cliente (código que deseja criar objetos) use a interface para criar objetos sem precisar se preocupar com os detalhes de como os objetos são criados.

