## [🏭 Padrões criacionais](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/)

<details>
<summary>Factory</summary>
  <br>

  - Usado para criar objetos de forma flexível e desacoplada.

  - Ajuda a promover o princípio do **Open/Closed** - o código deve estar aberto para extensão, mas fechado para modificação. 

  - É útil em situações em que você não sabe exatamente qual classe de objeto deve ser instanciada até o tempo de execução.

  - A ideia central do padrão Factory é definir uma interface (ou classe abstrata) que declara um método para a criação de objetos. 
    - As classes concretas que implementam essa interface fornecem a implementação real desse método, criando instâncias de objetos específicos. Isso permite que o cliente (código que deseja criar objetos) use a interface para criar objetos sem precisar se preocupar com os detalhes de como os objetos são criados.
</details>

<details>
<summary>Abstract</summary>
  <br>

  - Abstract Factory, também conhecido como fábrica abstrata, é um padrão de criação. Ele permite que você crie objetos que dependem uns dos outros sem conhecer os detalhes específicos de suas classes.

  - O seu objetivo principal é fornecer uma interface para criar famílias de objetos relacionados, de forma que a implementação concreta desses objetos seja adiada até o tempo de execução. Isso promove o princípio do "Design para Interface, não para Implementação".

  - Desacopla o código cliente que utiliza os objetos da lógica de criação deles. Isso torna mais fácil substituir famílias inteiras de objetos, pois o cliente não precisa ser alterado. Além disso, é mais fácil adicionar novas famílias de objetos ou estender as existentes sem modificar o código cliente.

</details>

