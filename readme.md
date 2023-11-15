## 🤷‍♀️ Sobre 

- Repositório com exemplos práticos de Padrões de projeto. Intuito dele é mais educativo, dessa forma os exemplos não possuem regras de negócio complexas.

> Referências: chatGPT, [Refactoring.Guru](https://refactoring.guru).
  
<br>

## [🏭 Padrões criacionais](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/)

<details>
<summary>Factory (Método fábrica) </summary>
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
<summary>Abstract Factory (Fábrica abstrata)</summary>
  <br>

  - É um padrão de criação. Ele fornece uma interface abstrata (geralmente uma classe ou conjunto de métodos) para criar famílias de objetos relacionados. 

  - Resumindo, o Abstract Factory envolve:

    - Abstração da fábrica: define uma interface que declara a criação de objetos relacionados. Exemplo: `UIFactory`

    - Fábricas concretas: fornecem a implementação real para criar os objetos. Exemplo: `WebFactory e MobileFactory`

    - Famílias de produtos: São conjuntos de objetos relacionados. Exemplo: `Button e Input`

  - É usado quando você precisa criar objetos que compartilham uma interface comum, mas pertencem a famílias diferentes, e você deseja garantir que essas famílias de objetos sejam consistentes e intercambiáveis. Isso promove um código mais flexível, de fácil manutenção e menos propenso a erros.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/abstract_factory.rb">👩🏼‍💻 Show me the code</a>

</details>

<br>

<details>
<summary>Builder (Construtor)</summary>
  <br>

  - Usado quando precisamos construir objetos complexos com muitos atributos configuráveis, passo a passo. Ele simplifica o processo de instanciação de objetos.
  
  - Permite separar a construção de um objeto complexo da sua representação para que o mesmo processo de construção possa criar representações diferentes.

  - O padrão Builder é útil quando:
    - a construção de um objeto é algo independente das partes que compõem (métodos que estão construindo o objeto). 
    - pode haver muitas maneiras de construir objetos complexos.
    - trabalha-se com muitos parâmetros no construtor

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/builder.rb">👩🏼‍💻 Show me the code</a>

</details>

<br>

<details>
<summary>Prototype (Clone)</summary>
  <br>

  - Esse padrão é utilizado para criar objetos duplicados (clones), a partir de um objeto original chamado protótipo. 

  - É particularmente útil quando a criação de um objeto é mais custosa em termos de recursos ou complexa, e você deseja criar cópias desse objeto com facilidade.

  - O principal objetivo do padrão Prototype é permitir a criação de novos objetos a partir de um modelo (protótipo) preexistente, copiando suas propriedades e valores, em vez de criar novas instâncias do zero. Isso evita a necessidade de recriar o objeto original e permite que você crie clones com configurações personalizadas.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/prototype.rb">👩🏼‍💻 Show me the code</a>

</details>

<br>

<details>
<summary>Singleton (Carta única)</summary>
  <br>

  - Tem o objetivo de garantir que uma classe tenha uma única instância e fornece um ponto global de acesso a essa instância. Em outras palavras, o padrão Singleton assegura que, independentemente de quantas vezes você tente criar um objeto de uma determinada classe, você sempre receberá a mesma instância, garantindo que haja uma única fonte de controle para essa classe.

  - O Singleton é útil em situações em que você deseja ter apenas uma instância de uma classe para controlar recursos compartilhados, como configurações, pools de conexão, caches, registros de eventos ou qualquer outra informação que deve ser globalmente acessível. 

  - Muitos desenvolvedores consideram o padrão Singleton um antipadrão. É por isso que seu uso está diminuindo no código Ruby.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/singleton.rb">👩🏼‍💻 Show me the code</a>

</details>

<br>

## [🏗️ Padrões estruturais](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/criacionais/)

<details>
<summary>Adapter</summary>
  <br>

  - Ele atua como uma "ponte" entre duas classes ou sistemas que não poderiam se comunicar diretamente devido a diferenças em suas interfaces, estruturas ou funcionalidades.

  - O padrão Adapter é especialmente útil em situações em que você precisa integrar sistemas legados, bibliotecas de terceiros ou serviços externos em seu código, sem modificar o código existente. 

  - Essencialmente, o Adapter funciona como um tradutor, convertendo as chamadas de métodos e dados de um formato ou estrutura em outro, garantindo que duas partes do sistema possam se comunicar sem problemas. Isso promove a reutilização de código e simplifica a manutenção, uma vez que as alterações em um sistema não afetarão necessariamente o outro, desde que a interface do Adapter seja mantida consistente.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/estruturais/adapter">👩🏼‍💻 Show me the code</a>

</details>

<br>

<details>
  <summary>Bridge (Ponte) 🌉</summary>
  <br>

  - O principal objetivo do padrão Bridge é separar a abstração da implementação, permitindo que a alteração em uma delas não afete a outra. 

  - A ideia central dele é criar uma ponte entre a abstração e a implementação, de modo que ambas possam ser estendidas sem depender uma da outra. Isso oferece flexibilidade, manutenção mais fácil e evita a necessidade de criar um grande número de subclasses.

  - O padrão Bridge permite que você tenha uma hierarquia para abstrações e outra para implementações, e essas hierarquias são independentes e podem ser compostas de várias maneiras.

  - O padrão Bridge é amplamente utilizado em situações em que é importante manter a flexibilidade do sistema, como ao lidar com diferentes sistemas operacionais, bancos de dados, protocolos de comunicação ou dispositivos de hardware.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/estruturais/bridge">👩🏼‍💻 Show me the code</a>
</details>

<br>

<details>
  <summary>Composite (Árvore de objetos) 🌳</summary>
  <br>

  - O padrão Composite permite criar estruturas de objetos hierárquicas, onde os objetos individuais e suas composições são tratados de maneira uniforme. Isso significa que você pode tratar um único objeto e um grupo de objetos da mesma maneira.

  - Em termos simples, imagine que você está construindo uma árvore de objetos. Essa árvore pode conter objetos individuais (folhas) ou grupos de objetos (nós) que, por sua vez, podem conter mais objetos individuais ou grupos. O padrão Composite permite que você trate tanto as folhas quanto os nós da árvore da mesma maneira, sem precisar distinguir entre eles.

  - Ele é frequentemente usado em sistemas que precisam representar hierarquias, como árvores, gráficos e interfaces de usuário

  - Um exemplo comum de uso do padrão Composite é a representação de sistemas de arquivos, onde você tem arquivos individuais e diretórios que podem conter mais arquivos ou diretórios.
 
  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/estruturais/composite">👩🏼‍💻 Show me the code</a>
</details>

<br>