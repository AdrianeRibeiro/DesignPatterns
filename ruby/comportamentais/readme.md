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

<br>
<details>
<summary>Memento 📷</summary>
  <br>
  - O padrão `Memento` é usado para capturar um estado interno de um objeto, permitindo que o objeto seja restaurado para esse estado mais tarde, sem quebrar a encapsulação. Esse padrão é útil quando você precisa implementar operações de desfazer (undo) ou restaurar o estado anterior de um objeto.

  <br>

  > Componentes do Padrão `Memento`
  
  1. Originator (Originador):
  - É o objeto cujo estado interno será salvo e restaurado. Ele cria um `Memento` que representa seu estado interno e também pode usar um `Memento` para restaurar seu estado interno anterior.

  2. `Memento`:
  - É uma classe que representa o estado de um objeto Originator em um determinado momento. Geralmente, contém uma cópia do estado interno do Originator.

  3. Caretaker (Zelador):
  - É responsável por manter os objetos `Memento` em uma lista. Ele não manipula o estado interno do `Memento`, apenas cuida deles e fornece a funcionalidade para que o Originator possa salvar e restaurar seu estado através dos Mementos.

  <br>

  > Benefícios do Padrão
  - Permite que um objeto restaure seu estado anterior facilmente.
  - Mantém o encapsulamento do objeto, já que apenas o Originator pode acessar o estado contido no `Memento`.
  - Facilita a implementação de operações de desfazer e refazer.

  <br>

  > Quando usar?
  - Quando você precisa implementar operações de desfazer e refazer em sua aplicação.
  - Quando você precisa capturar e restaurar o estado interno de um objeto sem quebrar a encapsulação.
  - Quando você quer ter a possibilidade de salvar e restaurar estados anteriores de um objeto.

  > Analogia com um Editor de texto
  
  - Usuário:
    - Você, como usuário do editor de texto, é o Originator. Você está criando e editando o documento.

  - Estado do Documento:
    - O estado do documento em um determinado momento, incluindo o texto, formatação, imagens, etc., é como um Memento. Cada vez que você faz uma edição significativa, o estado atual do documento é capturado como um Memento.

  - Histórico de Revisão:
    - O histórico de revisão do editor de texto, que mantém uma lista de todas as versões anteriores do documento, é como o Caretaker. Ele armazena todos os Mementos (ou estados anteriores do documento) em uma lista.
  
  - Operação de Desfazer/Refazer:
    - Quando você deseja desfazer uma alteração no documento, você solicita ao editor para restaurar a versão anterior do documento a partir do histórico de revisão. Isso é semelhante a solicitar ao Caretaker um Memento anterior para restaurar o estado anterior do documento.
    - Quando você deseja refazer uma alteração previamente desfeita, você solicita ao editor para avançar para a próxima versão do documento no histórico de revisão. Isso é semelhante a solicitar ao Caretaker o próximo Memento na lista para restaurar o estado seguinte do documento.

  <a href="https://github.com/AdrianeRibeiro/DesignPatterns/tree/main/ruby/comportamentais/memento/">👩🏼‍💻 Show me the code</a>
</details>

