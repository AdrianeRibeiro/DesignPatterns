### [Padrões estruturais 😐](https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/)

<br>

<details>
<summary>Adapter</summary>
  <br>

  - Ele atua como uma "ponte" entre duas classes ou sistemas que não poderiam se comunicar diretamente devido a diferenças em suas interfaces, estruturas ou funcionalidades.

  - O padrão Adapter é especialmente útil em situações em que você precisa integrar sistemas legados, bibliotecas de terceiros ou serviços externos em seu código, sem modificar o código existente. 

  - Essencialmente, o Adapter funciona como um tradutor, convertendo as chamadas de métodos e dados de um formato ou estrutura em outro, garantindo que duas partes do sistema possam se comunicar sem problemas. Isso promove a reutilização de código e simplifica a manutenção, uma vez que as alterações em um sistema não afetarão necessariamente o outro, desde que a interface do Adapter seja mantida consistente.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/adapter">👩🏼‍💻 Show me the code</a>

</details>

<br>

<details>
  <summary>Bridge (Ponte) 🌉</summary>
  <br>

  - O principal objetivo do padrão Bridge é separar a abstração da implementação, permitindo que a alteração em uma delas não afete a outra. 

  - A ideia central dele é criar uma ponte entre a abstração e a implementação, de modo que ambas possam ser estendidas sem depender uma da outra. Isso oferece flexibilidade, manutenção mais fácil e evita a necessidade de criar um grande número de subclasses.

  - O padrão Bridge permite que você tenha uma hierarquia para abstrações e outra para implementações, e essas hierarquias são independentes e podem ser compostas de várias maneiras.

  - O padrão Bridge é amplamente utilizado em situações em que é importante manter a flexibilidade do sistema, como ao lidar com diferentes sistemas operacionais, bancos de dados, protocolos de comunicação ou dispositivos de hardware.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/bridge">👩🏼‍💻 Show me the code</a>
</details>

<br>

<details>
  <summary>Composite (Árvore de objetos) 🌳</summary>
  <br>

  - O padrão Composite permite criar estruturas de objetos hierárquicas, onde os objetos individuais e suas composições são tratados de maneira uniforme. Isso significa que você pode tratar um único objeto e um grupo de objetos da mesma maneira.

  - Em termos simples, imagine que você está construindo uma árvore de objetos. Essa árvore pode conter objetos individuais (folhas) ou grupos de objetos (nós) que, por sua vez, podem conter mais objetos individuais ou grupos. O padrão Composite permite que você trate tanto as folhas quanto os nós da árvore da mesma maneira, sem precisar distinguir entre eles.

  - Ele é frequentemente usado em sistemas que precisam representar hierarquias, como árvores, gráficos e interfaces de usuário

  - Um exemplo comum de uso do padrão Composite é a representação de sistemas de arquivos, onde você tem arquivos individuais e diretórios que podem conter mais arquivos ou diretórios.
 
  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/composite">👩🏼‍💻 Show me the code</a>
</details>

<br>

<details>
  <summary>Decorator 🪆</summary>
  <br>

  - Permite adicionar novas funcionalidades a um objeto sem precisar adicionar esse comportamento à classe do objeto. 
    - Isso é feito por meio da criação de classes que envolvem os objetos originais e adicionam funcionalidades a eles.

  - É possível encadear vários decoradores para criar combinações de funcionalidades em tempo de execução. Cada decorador pode adicionar ou modificar o comportamento do objeto original sem quebrar a estrutura existente. 
    - Isso evita a criação de subclasses excessivas para cada combinação possível de funcionalidades.

  > Suponha que você tenha uma classe **`Texto`** que representa um texto simples e deseja adicionar formatações como negrito, itálico e sublinhado sem modificar a classe **`Texto`**. Usando o padrão Decorator, você pode criar classes decoradoras para adicionar essas formatações.
 
  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/decorator">👩🏼‍💻 Show me the code</a>
</details>

<br>

<details>
  <summary>Facade 🏠</summary>
  <br>

  - O padrão Facade tem como objetivo fornecer uma interface simplificada para um conjunto de interfaces mais complexas. Ele atua como uma camada intermediária que oculta a complexidade do sistema subjacente, fornecendo uma interface mais simples para o cliente.

  - Vantagens do Padrão Facade:

    - 1. **Simplicidade para o Cliente:** O cliente interage com uma interface simples e não precisa se preocupar com a complexidade interna do sistema.

    - 2. **Desacoplamento:** O cliente não precisa conhecer os detalhes internos do subsistema. Isso permite que o subsistema evolua sem afetar o cliente.

    - 3. **Melhor Legibilidade e Manutenção:** Melhora a legibilidade do código, pois reduz a quantidade de código que o cliente precisa entender. Também facilita a manutenção, pois as mudanças internas no subsistema podem ser tratadas pela fachada.

  > Vamos imaginar um sistema de home theater com várias complexidades, como controle de som, luzes, projeção, etc. O padrão Facade poderia ser usado para criar uma interface simples, onde o cliente só precisa interagir com uma classe HomeTheaterFacade. Essa fachada, por sua vez, lidaria com as interações complexas com o sistema de home theater, chamando os métodos apropriados nos subsistemas (controle de som, luzes, etc.).
 
  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/facade">👩🏼‍💻 Show me the code</a>
  <a href="https://blog.appsignal.com/2020/03/18/facade-pattern-in-rails-for-performance-and-maintainability.html">📚 Facade Pattern in Rails</a>
</details>

<br>

<details>
  <summary>Proxy</summary>

  - O padrão de Proxy é um padrão estrutural. O Proxy age como um intermediário, permitindo que um cliente interaja com um objeto por meio do Proxy, que gerencia o acesso ao objeto real.

  - A principal motivação por trás do uso do padrão Proxy é controlar e gerenciar o acesso a um objeto de maneira mais eficiente. Isso pode ser útil em várias situações, como quando o objeto real é custoso em termos de recursos computacionais, ou quando é necessário adicionar funcionalidades adicionais ao acesso ao objeto, como controle de permissões, registro de acessos, ou até mesmo atrasos na inicialização.

  - Existem diferentes tipos de Proxies, cada um com um propósito específico. Alguns exemplos incluem:

    - Proxy Virtual: Adia a criação e a inicialização do objeto real até que seja realmente necessário. Isso é útil quando a criação do objeto é custosa e pode ser evitada até que seja absolutamente necessária.

    - Proxy de Proteção: Controla o acesso ao objeto real, permitindo ou negando solicitações com base em permissões ou credenciais. Isso é útil para implementar sistemas de segurança.

    - Proxy Remoto: Controla o acesso a objetos que residem em diferentes espaços de endereçamento, como em sistemas distribuídos. O Proxy Remoto é responsável por gerenciar a comunicação entre o cliente e o objeto remoto.

  - Em resumo, o padrão de design Proxy é uma abordagem para fornecer um substituto controlado de um objeto, com quem o cliente interage. Isso oferece benefícios como otimização de recursos, implementação de funcionalidades adicionais e controle de acesso.
  
  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/proxy">👩🏼‍💻 Show me the code</a>
</details>

<br>

<details>
  <summary>Flyweight</summary>

  - O padrão de projeto Flyweight é um padrão estrutural que visa otimizar o uso de memória ou recursos, compartilhando o máximo possível entre objetos similares. Ele é particularmente útil quando você tem um grande número de objetos semelhantes, e a redução do consumo de memória é crucial.

  - A ideia fundamental por trás do padrão Flyweight é dividir os objetos em duas partes: a parte intrínseca e a parte extrínseca. 
    - A parte intrínseca contém as informações que são compartilhadas entre objetos e não mudam. 
    - A parte extrínseca contém as informações que variam entre objetos.
  
  - O padrão Flyweight é frequentemente usado em situações onde a criação e manutenção de um grande número de objetos similares pode consumir muitos recursos (Exemplos: jogos, aplicações de interfaces gráficas, sistemas financeiros). Ele ajuda a reduzir a duplicação de dados, otimizando o desempenho e a eficiência.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/estruturais/flyweight">👩🏼‍💻 Show me the code</a>
</details>


