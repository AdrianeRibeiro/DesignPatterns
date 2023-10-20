## [🏭 Padrões criacionais](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/)

<details>
<summary>Factory</summary>
  <br>

  - Usado para criar objetos de forma flexível e desacoplada.

  - Ajuda a promover o princípio do **Open/Closed** - o código deve estar aberto para extensão, mas fechado para modificação. 

  - É útil em situações em que você não sabe exatamente qual classe de objeto deve ser instanciada até o tempo de execução.

  - A ideia central do padrão Factory é definir uma interface (ou classe abstrata) que declara um método para a criação de objetos. 
    - As classes concretas que implementam essa interface fornecem a implementação real desse método, criando instâncias de objetos específicos. Isso permite que o cliente (código que deseja criar objetos) use a interface para criar objetos sem precisar se preocupar com os detalhes de como os objetos são criados.
  
  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/factory.rb">👩🏼‍💻 Show me the code</a>
</details>

<br>

<details>
<summary>Abstract Factory</summary>
  <br>

  - Também conhecido como fábrica abstrata, é um padrão de criação. Ele fornece uma interface abstrata (geralmente uma classe ou conjunto de métodos) para criar famílias de objetos relacionados. 

  - Resumindo, o Abstract Factory envolve:

    - Abstração da fábrica: define uma interface que declara a criação de objetos relacionados. Exemplo: `UIFactory`

    - Fábricas concretas: fornecem a implementação real para criar os objetos. Exemplo: `WebFactory e MobileFactory`

    - Famílias de produtos: São conjuntos de objetos relacionados. Exemplo: `Button e Input`

  - É usado quando você precisa criar objetos que compartilham uma interface comum, mas pertencem a famílias diferentes, e você deseja garantir que essas famílias de objetos sejam consistentes e intercambiáveis. Isso promove um código mais flexível, de fácil manutenção e menos propenso a erros.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/abstract_factory.rb">👩🏼‍💻 Show me the code</a>

</details>

