### 🤷‍♀️ Sobre 

- Repositório com exemplos práticos de Padrões de projeto. 
- O intuito do repositório é mais educativo, dessa forma, os exemplos de código não são complexos.

> Referências: chatGPT, [Refactoring.Guru](https://refactoring.guru).
  
<br>

### [🏗️ Padrões comportamentais](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/comportamentais/)

<details>
<summary>Chain of Responsibility 🔗</summary>
  <br>

  - O padrão `Chain of Responsibility` (Corrente de Responsabilidade) permite que você passe uma solicitação através de uma cadeia de handlers. 
    - Cada handler decide se processa a solicitação ou a passa para o próximo handler na hierarquia. Isso cria uma sequência de handlers, onde cada um tem a oportunidade de processar a solicitação ou encaminhá-la para o próximo na cadeia.

  - A estrutura básica do padrão `Chain of Responsibility` inclui três componentes principais:

    - Handler (Manipulador): define uma interface para manipular solicitações e mantém uma referência para o próximo manipulador na cadeia. Geralmente, é uma classe abstrata ou uma interface.

    - ConcreteHandler (Manipulador Concreto): implementa a interface do Handler e fornece a implementação para processar a solicitação. Também pode decidir se passa a solicitação para o próximo manipulador na cadeia.

    - Client (Cliente): inicia a solicitação e a envia para o primeiro manipulador na cadeia. O cliente não precisa conhecer todos os detalhes da cadeia de manipuladores, apenas inicia a solicitação.

  - O padrão `Chain of Responsibility` é útil quando você tem vários objetos que podem lidar com uma solicitação, mas não sabe qual deles será responsável até o tempo de execução. 

  - Um exemplo comum de aplicação do `Chain of Responsibility` é em sistemas de processamento de eventos, validação de entrada ou em cenários em que existem várias etapas de manipulação de dados. Cada manipulador na cadeia pode representar uma etapa específica no processamento.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/comportamentais/cor/">👩🏼‍💻 Show me the code</a>
</details>

<br>
<details>
<summary>Command 📢</summary>
  <br>

  - O command transforma um pedido em um objeto independente que contém toda a informação sobre o pedido.

  > Analogia
  
  - Vamos imaginar um restaurante como uma analogia para entender o padrão de design Command.

    - Pedido do Cliente (Command): Um cliente decide o que deseja do cardápio (comando).

    - Garçom (Invoker): O garçom recebe o pedido do cliente e o entrega à cozinha sem saber como o prato será preparado.

    - Cozinheiro (Receptor): O cozinheiro sabe como preparar cada prato e executa a ação associada ao pedido.

    - Cardápio (Command): O cardápio representa a lista de comandos disponíveis. Cada prato no cardápio é um comando concreto que pode ser executado.
    
  > Benefícios

  - Desacoplamento: O garçom não precisa saber como cada prato é preparado. Ele simplesmente passa os pedidos para a cozinha. 

  - Atraso na Execução: Os pedidos são atrasados até que sejam necessários.

  - Suporte a Operações Desfazer/Refazer: Se houver um erro no pedido, o cliente pode solicitar uma correção. 

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/comportamentais/command/">👩🏼‍💻 Show me the code</a>
</details>

<br>
<details>
<summary>Iterator 🔁</summary>
  <br>

  - O padrão Iterator é um padrão de projeto comportamental que fornece uma maneira de acessar sequencialmente elementos de um objeto agregado sem expor os detalhes subjacentes da implementação. Basicamente, ele permite percorrer uma coleção de objetos sem precisar conhecer a estrutura interna dessa coleção.

  - Vantagens: O padrão Iterator simplifica a interface de acesso a elementos de uma coleção, desacopla o código do cliente da implementação específica da coleção e permite a adição de novos tipos de coleções sem modificar o código do cliente.

  > Analogia

  - Imagine que uma biblioteca é uma coleção de livros, e você, como leitor, deseja percorrer esses livros. Nesse contexto:

    - Biblioteca: Representa a coleção de livros, análogo ao objeto agregado.

    - Leitor: Representa o código cliente que deseja acessar os livros, análogo ao cliente do padrão Iterator.

    - Prateleiras e Livros: São os elementos individuais da coleção, análogos aos elementos da coleção no padrão Iterator.

    - Bibliotecário: Pode ser considerado o iterador. O bibliotecário conhece a organização interna da biblioteca (a coleção) e fornece ao leitor um método para percorrer os livros de uma maneira organizada, sem que o leitor precise entender como os livros estão dispostos nas prateleiras.

    Assim como o leitor não precisa se preocupar em conhecer os detalhes de organização da biblioteca, no padrão Iterator, o cliente não precisa se preocupar com a estrutura interna da coleção. O iterador (ou bibliotecário) fornece um método consistente para percorrer os elementos da coleção, independentemente de como eles estão organizados internamente.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/comportamentais/iterator/">👩🏼‍💻 Show me the code</a>
</details>

<br>
<details>
<summary>Mediator 🕊️</summary>
  <br>

  - O padrão Mediator promove o desacoplamento de objetos comunicantes, ao centralizar suas interações através de um objeto mediador. 
    - Ele facilita a comunicação indireta entre os objetos, reduzindo as dependências diretas entre eles.
    - É útil quando um conjunto de objetos precisa se comunicar de maneira complexa, mas você deseja evitar que eles se comuniquem diretamente uns com os outros.

  > Analogia:
  
  - Pilotos de aeronaves não falam entre si diretamente na hora de decidir quem é o próximo a aterrisar seu avião. Toda comunicação passa pela torre de controle.

  > Vantagens:

  - Desacoplamento:
    - Reduz o acoplamento entre os objetos, já que eles não precisam se conhecer diretamente.
    - Facilita a manutenção e extensão do sistema, pois mudanças em um objeto não afetam diretamente os outros.

  - Centralização do controle:
    - Centraliza a lógica de comunicação em um único lugar (o mediador), tornando o código mais organizado e fácil de entender.

  - Promove a reutilização de código:
    - Os objetos podem ser reutilizados em diferentes contextos, pois sua lógica de comunicação está separada do restante do código.

  - Facilita a adição de novos objetos:
    - Adicionar novos objetos que interagem com os outros é mais simples, pois eles só precisam se comunicar com o mediador, não com todos os outros objetos.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/comportamentais/mediator/">👩🏼‍💻 Show me the code</a>
</details>